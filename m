Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp1308027njk;
        Fri, 29 Nov 2024 22:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnNSNzmNBQMPWelQ1j1tqaXRDJ9WZvTybxieIjtUeuCNsCJBMTFxxYZoer/LuK9mofJc7L87bxMqUVmw==@linaro.org
X-Google-Smtp-Source: AGHT+IFTvQY7eeXYgPt1+TVFmMUmTSNHPOWPEff01wSB3uMCMOyAhdxBcGgpHD/vGNpPxjjZyLyF
X-Received: by 2002:a05:622a:588d:b0:466:a2c2:f37b with SMTP id d75a77b69052e-466b369136bmr281972111cf.34.1732947472256;
        Fri, 29 Nov 2024 22:17:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732947472; cv=none;
        d=google.com; s=arc-20240605;
        b=d+7CqBBUEPPrOyoiO6tpGxuxvKPkQMtCmZ2lY7cK7u7mIUdSAwGeyBEeEi40LqM9qS
         VN3S8B9TWAOrtRZWstgZNvolEMigItoZS7GJ10CqMFyno5KroX2OjeyYfNsEN6SQCTDV
         te7uBzbTzkJc+zOq1bkwI1uvAl+R1vnUdaVKj4LHgqDhg5VKqfmUJpQonfDE1U9v7LwW
         eOm9JfRRmMZL+JwjfGxB/ZQv5fIIb+q3cVfNuU9SYqiHGax5oPFHlAR+lZHQOqUZgI/v
         b9jruZP7fPqHLPMHDoEdlYoywvuty9oOYvhSC6TcGFff6fKj4NFoQxFcuaO82KK6Yp6W
         Intw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iAADfka+wJ/6sNT0BcTzF7GinB4EOzBtyw1Ynff8yIo=;
        fh=dBFKSMz81rvGNMIFoVm32WQVCInwnnCGJECf/qGvlSc=;
        b=WiOrE8AZIyNnYs3JTH9r/RtrI5yjvVEuXMdoV9lc9bSx4h74wQrls1Lq5vXOtTPeA5
         z/9NuzRNnnSOBWez2T7qP5MVElreQ0RgHxz70HovruIGOGifAntWFDG4iuuRKDkguxHz
         KvuooyUCT79lOMbt2XXjOe77VSaXFvzKNUjxvRUk+CLqCiy0wUggDU+LvrBjffBzaLkd
         z1WTL3VdEbXuPwrxTBJ3b5L+tLlS+ji2pz2vHYEltkmgLkDCTxjZxLgoWTKbpEvc71nc
         1pyv/76L5auQbnLZU7xjQvyktzZP0EuKVJnLgvL2cXVEaOqp2h8tHoNWczn/tQQFb2qa
         OhBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Pl49k1B7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4460909si62158571cf.702.2024.11.29.22.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 22:17:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Pl49k1B7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHGnc-0008Cf-LN; Sat, 30 Nov 2024 01:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGmQ-0007fj-Ho
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:16:35 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGmN-0002xM-DN
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:16:34 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-211fb27cc6bso19357665ad.0
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 22:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947389; x=1733552189;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iAADfka+wJ/6sNT0BcTzF7GinB4EOzBtyw1Ynff8yIo=;
 b=Pl49k1B7pvKog+SXw0l3/mK8xGj3Z+Gw5RyCPUF/V4Ts6517lZyARrLfSdssUNrD/u
 +ELOuVOivEG8kDuFuUWoA8i7G94wY0pbzocnMNwS11PnZuWJrS+ybGdMdpb9n6J0dx7v
 basYQOxYiY4PvAVMPRTUE8DOy+d8jP5I1OiGb3RcsvV+FyG/gJmi9SVHvhF1Kx7ZKDDy
 G1xypxl+J4IIxT0hPRxs5SSRJnIGn/DZW/j2g7xKaIEYMcCJacHeAEltnvL5qlEuISIg
 MpiKUcN6p2LBBbi8awUR0WO6A8PrLNIqKxwPHTTaC7FFWxtb8Llb6bK2dAKqn0h2fdQU
 jFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947389; x=1733552189;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iAADfka+wJ/6sNT0BcTzF7GinB4EOzBtyw1Ynff8yIo=;
 b=kfN8wScZhjem8vSZ+curLSc0nmobACmjol/KVKAToUDvwSgqbkwc+G4c4V0lO+7peA
 Ln82iTML6W9ll3e/FJdWa6WAmSOKryVH8rdLZb4uimTuh4KgTe9C/Tepi3SZd374rZKY
 aXlCwwyuajFavvl8SHzsPaHHze+uTFUI9neqM9LEYtVXkUn1sUDqii5RZFfx+1JVLbZi
 TxGTN3ecX2Vb4EknE2IeJkoYappoiWWpKhLOY8xVX69guTRyD6jYD8TnaKTycEw0Eryn
 Xzfbp9pXBENvgoitJ9fkH5HGgWzWUOhcMYed71O2MHvoE2rwGJmCCg8yrjOSBNk5+jQW
 7Nig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+H8JU1FxwhJlgGIbeP8jo65mZmREey5Sa5KbjVgpLqFU/ibYwGJJHMnqwYI95Yr71L4iUeyXieg==@nongnu.org
X-Gm-Message-State: AOJu0YztxwRAioilbxiLtRRkJDSCFxrBzt+PmBkDk0K8YoD3KIIR4rt8
 hntys4NsNdtWn8FBvXLt2VLtbjYaisssClXBmyEsan7eZZVt1qyr535cw1XgzV0=
X-Gm-Gg: ASbGncs9WHptEhxpahSootF8D89u/zSgL7vofTHplkhzQpnbnehLlZohC6MPV7jtAW3
 q1xCybLwuDbMQ2MoxAUQqhmF2oP8WQ3n15tViCrqVmLwqC67yaE+7BU0/yZTlBXJBceaoZkKwGE
 AG+ukOLDTrdsK5rCh631VBf1zT5Q2kUv6hPlWnPunIcHWLIs+OMOJNJDLe4aSuBq3ErENcXqqW/
 T5goCaluDDDbQnbk39+77qZcg3sg5yxOTFXoSniL+CPSyz0LFmiZsUQ5GSjp3Q=
X-Received: by 2002:a17:902:cec1:b0:20b:5b1a:209 with SMTP id
 d9443c01a7336-2150108cac1mr201300605ad.9.1732947389627; 
 Fri, 29 Nov 2024 22:16:29 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2154be15034sm15955885ad.205.2024.11.29.22.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:16:29 -0800 (PST)
Message-ID: <80bc3a21-9b0a-422e-a6dd-c58d39c7441f@daynix.com>
Date: Sat, 30 Nov 2024 15:16:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 10/15] hw/vmapple/aes: Introduce aes engine
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-11-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-11-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 88A8hUild8Sk

On 2024/11/30 0:25, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> VMApple contains an "aes" engine device that it uses to encrypt and
> decrypt its nvram. It has trivial hard coded keys it uses for that
> purpose.
> 
> Add device emulation for this device model.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
