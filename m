Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp1308961njk;
        Fri, 29 Nov 2024 22:20:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQV8OyX1QS2dTQ7WSDnIsQZH90hKW/B4XOT3NvM1AINPuHw1Q6mpJXk4rakF3J1tSABQvqKYpCgoiEZw==@linaro.org
X-Google-Smtp-Source: AGHT+IEIU3Zb18ZZ53B93SEP+I2VKU6SAdlNg4bVk89KUCqiIKZOdFOXuKEiyNQZTFr+TFnMcP50
X-Received: by 2002:a05:6214:20c4:b0:6d8:932a:eaa3 with SMTP id 6a1803df08f44-6d8932aee5amr22627036d6.3.1732947645773;
        Fri, 29 Nov 2024 22:20:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732947645; cv=none;
        d=google.com; s=arc-20240605;
        b=Xy4IgBJ+IK9/Q0S/poddkhuwSdJmWwxjQOm2muwpwcui3lVh5nr50yxhGkMIVaQxsY
         esvhCvxcUBGzUwsZ1kOc7sNTtm+4LoSj6obvPsK+tPHbQ+iNaninRzq7miBDHMA20y5L
         mJfI1PM0nNfeMPtfjgrzQn34B1WELhT8ShWtLZNmvCkHFuT+ff8S2xC/ENbJrj3pWFo2
         NbYz/ky0A8r0bxr7oUkxVZ15ufu17tM16dI/YmvjRMp0H6B3/xB/97aLmJlXeCV4nGEy
         KOLCqOYBtqD/PSeNtZAIDuhScpOT3o9D8kxnaLVQ9NVxH0A7wXCiVAYJo7SLPjOejGd8
         mNZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UaU0zOmZ0YAsn6aSvaKXwr7t6amJcWxMlrxWLIfv/DA=;
        fh=YDHB/mdhCpEyeoWxsnzlKKpBYTYoRddObBDTPVgaxdg=;
        b=YYEZUgEBN5hqk1bn1S/ihPKtst1a4oMghnKKyg2rKKv1/xIEcFJ8qG/hwToQrzHH8o
         58HIMTIShkh2Ka7+tK1yfE98/HZkWFy6OZTNvCYBej7Cyvxxc+i95xMHPHlsvG1F1SbJ
         7/jk6ztwga9xxSgo2vD1tnVKQ07kp8UmdtfYS5syqlaWRn1pQ7K72UtIWzRSzHCb9CtF
         zCdPrrTde6ntv2FYw9/Y9Oc6TIHSX5jJDxhhWY1zkSQJ2AO71mpwmXYLVufb3uMFZ/r0
         JwuX3JXAV3nAoU79Cgi9+ltEpqS0QJbfohafmEDkvsn50iL0LqFIEKkxOLbkFH9+77Cy
         LMBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Acrcms97;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8754595cbsi68856696d6.372.2024.11.29.22.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 22:20:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Acrcms97;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHGqO-0004Oi-1V; Sat, 30 Nov 2024 01:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGqJ-0004O5-MQ
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:20:35 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGqE-0004YF-2e
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:20:33 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7250844b0ecso2167235b3a.1
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 22:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947629; x=1733552429;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UaU0zOmZ0YAsn6aSvaKXwr7t6amJcWxMlrxWLIfv/DA=;
 b=Acrcms97wL2b61kWh10SRWWr9Aalck37P3b8Pec2gIOMYv7zTKZuGFYMT9yh/V15GA
 eB5x7v2LZkhJOiR/Bw1eFWSDmaQ2mrdy+PzkDiEDlzvtWtncU/3SFCZHvVB2P3RVq8kv
 nGjA/hskohvkbsjHYLNv17Bs3fQommrc72eB+vNVwAxuOqLvbhMZz5ris0dQzMXQJYWi
 HwhdW9By851I6Iooqem174mbzRgLGeW8y9gyTpBmubA1SxO/2h/t8uDLoE+PPXkwJQ8c
 Bm0DABxWlbzR1yRZapD2xEiRyvUrdWU2/ULZimIq3Imc/j+hUlYpDzEatLcUzSLPsV9H
 bl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947629; x=1733552429;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UaU0zOmZ0YAsn6aSvaKXwr7t6amJcWxMlrxWLIfv/DA=;
 b=oztLQjOlmKWq1heoQ73q+AtoHK2Jg3j+uSEtvo6bFsrHQGtoCW+6F/ukuAycLoPpQp
 ItsCBz9Dd0/uLsqcOa47fu+9PeyK7+N7oDNDsvhAubokjTRAcXWX6oCwpMThWuK1NPXq
 rDsjoLRnNNzVPLq9++n1q2RwZg5NjWcJ4THl4dI3+Tmi3TcA07cuDwIjbi1S5WkktFr1
 /pU5Hs22HDMno2UWiaLaRraZj6Z43tBe/RF1wLEfNdVAvxld0xoBo5SmLv5dRpVDuv2n
 ZMe7x4CImWR68aehEvFXgxchkdEojT24+OnT+2KlSSl/xp239GBJ02/qjIiizXJXSBKG
 7Ddg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu54L+ZF1zyD/28j/K38apPN/nXbCcr9AOVtnRnkVaTsbI1RSDJFxOEyNoB/IYudgZVqh8VwsheQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywhi99ZD7n098F+gIGkok1bC+Yxl93j9OE919JYC8kszRzVxvDt
 735/V3Zcpo0C+o5fN9xkgrRy9a1Tun6y5UiXwkAU/sKdag7JqEPMt5uScEXvLWM=
X-Gm-Gg: ASbGncsWNU63mdf9/709+jd8uCvLBMpiAwc7rcQk4hZErV3a6LToa29xt89y8E4qx1+
 z4yiB20jRPq9nzNoJwfFLIRjzf1VbdCQMQWTYO2OKfvBd/STJsZNHji3wbQHsmHH4p/iVp1g5az
 TY9ZFeeHUJ9hWQKJJ4wdOZDs+WAuBsJN8ixrCUs0axcnsu+DRLP+Xe+WbXo8nZhU2bbUPN60SXJ
 X+D84frdmTxvo0yH9Qop6nwSUirIKDNIIS6v0DiESyz/rnYcIsuSaCU+bH+Ttc=
X-Received: by 2002:a05:6a00:4f88:b0:724:5aac:1687 with SMTP id
 d2e1a72fcca58-72530142fcfmr20927802b3a.20.1732947628647; 
 Fri, 29 Nov 2024 22:20:28 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725442c086csm4374934b3a.189.2024.11.29.22.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:20:28 -0800 (PST)
Message-ID: <1e437634-ea0c-48cc-a2ab-2ad3c6256fc4@daynix.com>
Date: Sat, 30 Nov 2024 15:20:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 14/15] hw/block/virtio-blk: Replaces request free
 function with g_free
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
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-15-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-15-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
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
X-TUID: SElRkNt74WUx

On 2024/11/30 0:25, Phil Dennis-Jordan wrote:
> The virtio_blk_free_request() function has been a 1-liner forwarding
> to g_free() for a while now. We may as well call g_free on the request
> pointer directly.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
