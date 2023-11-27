Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp662091ejt;
        Sun, 26 Nov 2023 16:20:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd1RcYdDoKfuXC9IQ8Y8wENSN9fx2Gi8xEvIzlT/mG8en1c4yL3B2+kFvnDrou5geFQgsM
X-Received: by 2002:a05:6214:2d0f:b0:67a:2012:b9a1 with SMTP id mz15-20020a0562142d0f00b0067a2012b9a1mr7886189qvb.55.1701044440777;
        Sun, 26 Nov 2023 16:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701044440; cv=none;
        d=google.com; s=arc-20160816;
        b=Euy2RBndLyiQ+1kc5xqjgEuEqcfcUVid65aVy1+iQWo2OB5jKDesVTJEtrdbAPkm3z
         tDWsU/VMZNMTee6+gTV8z4k/35mHrB3i8/JdOvSzMrQVFokRQXkeSqzrpcwjFTpfe1Ol
         aQkjcY9Kdw+ZtVxrGBEqvHldT8sx8j7uIXufb+KCWMVR2a4UZ05tBG4yGbLXRGu1NjWX
         OP50Gwp6Fv93pro8r8Pgc5Zv0dN6/+M7Tkoqktwdzlq19i5wtTwIyBDWVF8oI379ZZDJ
         GEOv0pV/oXSQdVgupV7YJQXHSW1dYWresRLuFTJ0EbliH13bYw2gTlxB9QGcyaOaFCtw
         9vIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wxMh/sdy5y9/QnCn8h9Cb7wT7P5pIJUK2yIt1wYKoX4=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=hhXxKGIusFM5kJtrimHrUZ2G7Ri3l66s10CD8NcAZqsaEmvt8nZTvnrpP4kF3DurjP
         vTVO6EPooy504d4rj0I2wwD8aNNZncDcD2wQXzAiQ8tdg5p/ZkACtOBb7AMzxXgspkGZ
         jHqhXecd3Oax9sSAWnHzeMIf886PxIMbjZAF2oCeFIBkbBRWVVCXRqyx5omzfOTOU+s9
         Vag3qGQpnzJZLON8HaDqyatq5HG5wgWpFAtZ7TmLTFKqbnYTF8KfagS3EhYubAy5Y2MV
         SZGbyxRTzE4ieMM8FKaSs4oF5Rw8wSS9zBhMRlU2EzbkWCWmjp+fshPiLK3uMSMSCgNV
         n4gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L7AbIkLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2-20020a0cfbc2000000b0067a228f3105si4731388qvp.413.2023.11.26.16.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 16:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L7AbIkLm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7PMU-0004GX-8E; Sun, 26 Nov 2023 19:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PMJ-0004DY-7n
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:20:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7PMH-0008Fg-QM
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 19:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701044417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxMh/sdy5y9/QnCn8h9Cb7wT7P5pIJUK2yIt1wYKoX4=;
 b=L7AbIkLmxS8xauI+UpWfhakhFxVjbblxfOrCtcta9HCgK6g8wmtxoiDV4wlrlHsQR9d34E
 bDgWL1ZF0yYa2YAhHrH7EdktiuRwI+uOkEmGyixBe0dJKgrwEbbNg4B1TKQrbzSUokMHI9
 RQKnleCxXx97M6Hrs30nk8DcpNh++JA=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-Hc7pC5GSP8q8vMmOAIuMeQ-1; Sun, 26 Nov 2023 19:20:15 -0500
X-MC-Unique: Hc7pC5GSP8q8vMmOAIuMeQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-6cd855b6003so830233b3a.3
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 16:20:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701044414; x=1701649214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wxMh/sdy5y9/QnCn8h9Cb7wT7P5pIJUK2yIt1wYKoX4=;
 b=LDQseaCzBLBmN5CkMkOK3mUnlL+sAAX/eU4vAoNjVZEKT24BJsQ3j9nDKeYxTGSlil
 taRbesUITFRbU5EHD2kHr/9kikljvTxtwlxmFtU8nIPvAecEkiDNqE/C4rRxywXPc1eO
 +0sBy9ZX0o35JRexwE90RJ1WhZvluVUrYzKXnkp8oS4kpTv1IL1OEOcoLPbOF2d6Lbr2
 vOJDvFfbQirqb332trdvVL8El9lU9ahnukshXicywJnOroy7DW2zkJGLRf1M/2VAa7M+
 UHuBUgcM/W5CEiadMABhorMiBPcR0F5qvLsD9QwxSOVv5j1mrH/X6uwx9gGdPtpsxh7X
 0aVA==
X-Gm-Message-State: AOJu0YxaO7ELkJN6Oj5oUbdE1kxIzuv0frxLu1/dwoMGytyFWM5aDnMC
 vaaBDkY8a3Kff5AkPeDRlJeYPNCWingAbPIAfpXszOj2GfDqlzphZiVs8Dk3wPK0SGaf2E4TO/Q
 yQtN2Q4Ktc9Yxb6WZ1K0k
X-Received: by 2002:a05:6a00:244c:b0:6b7:18c1:c09a with SMTP id
 d12-20020a056a00244c00b006b718c1c09amr8825787pfj.5.1701044414225; 
 Sun, 26 Nov 2023 16:20:14 -0800 (PST)
X-Received: by 2002:a05:6a00:244c:b0:6b7:18c1:c09a with SMTP id
 d12-20020a056a00244c00b006b718c1c09amr8825775pfj.5.1701044413964; 
 Sun, 26 Nov 2023 16:20:13 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 b14-20020aa7870e000000b006cbfbb3635bsm3943379pfo.161.2023.11.26.16.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 16:20:13 -0800 (PST)
Message-ID: <4bf7a242-49b1-4a27-aa68-99a811ae784c@redhat.com>
Date: Mon, 27 Nov 2023 11:20:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/21] target/arm/kvm: Unexport kvm_arm_init_cpreg_list
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-18-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-18-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Rlz0O1Zqr+66

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 12 ------------
>   target/arm/kvm.c     | 10 ++++++++--
>   2 files changed, 8 insertions(+), 14 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

