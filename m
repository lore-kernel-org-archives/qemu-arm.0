Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp1308256njk;
        Fri, 29 Nov 2024 22:18:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUDdLMP7KjHS0qAzwf3+tSqLTOHFsGxbdMtIVBvv2vYEbbhiKXDgo9C7t8IPVVEi+op7SdDy0Lif4ar5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHg4lda2+W3sBE0DtMAQx7SVVuVe0c2torgurMW2o4aK+lEhyoB4mNTTyIrcMSYvoMdUcKT
X-Received: by 2002:ac8:5d05:0:b0:466:b1ee:3be0 with SMTP id d75a77b69052e-466b3554538mr213972941cf.6.1732947506519;
        Fri, 29 Nov 2024 22:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732947506; cv=none;
        d=google.com; s=arc-20240605;
        b=YzYqCPZqlumY2ka8kLv5NpY9nT7o2iblytjYmUU6cdFP/IPmRVhryEh1pzOteSDaZU
         vrPuro8vhq4HrvQhgKsI1zdy8NPRKeKju0CV4/vZ6Jvp6KRVuthTtug4L8P/CD+1ccKC
         5SOQ2agWoHug6iRsVPukQFrixIVmsKNgOV9nOHAxp/DDB7syTsIfCBjaUkuThPv6Sv0u
         yi6pDgxbMDxnHa8GPCE3WM2roXfURBplrGxmcKQqo/VZpn9beMMq3CRoJX7ozDw4swjY
         FZ7+Yi0fp9IUKUhh8j9fwIvRrcxlsoJmgA2zfs4XAXkNDX9ssGRxWGnSrnzR5Q7B/tIX
         EoGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SMWMQmaQNFbs3p5wPSSszQIsEvcT+kEUXSJDlAfkhFg=;
        fh=t2C7UivgsYJ4Kqk1M782xBLP5ttl+sNOm4aBLsjKEXA=;
        b=bi14f4hDmWO0dP/sEpIHuuAseTvEEhM1qgN52VhwdsxLAg8LmhMSfN5hLXKohcbWED
         pf9yjaeR+Yh048Qg5d7wzeswUKO3ep1S/3+GU6yPe6cWfH00mBbW1hk/LH47z8Fn2svl
         A5/P/uYflDgFQaizlwzMOVdVrqe2EFWbfUzi8EecVoqggma9ZqyB61+ZnPSXwYfPo1m5
         tvsFRE2MMG6SsWllUNK8E1kG8j1I4cNOUwCsmKVnQKH9eKM774QMqijFuYRJSvM9v/RO
         RNzD0isQ2N3FrJzu62/8QEHtiTYpNzeQkKnTFV+3TZsDQwpM2ZKWRctulQZEPX9oJbbe
         k72Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=OQ9uEgER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4258225si56813011cf.582.2024.11.29.22.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 22:18:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=OQ9uEgER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHGnr-0008TE-4t; Sat, 30 Nov 2024 01:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGnA-00083y-5V
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:17:27 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGmt-0003Ab-J3
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:17:05 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-215348d1977so16326405ad.3
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 22:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947419; x=1733552219;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SMWMQmaQNFbs3p5wPSSszQIsEvcT+kEUXSJDlAfkhFg=;
 b=OQ9uEgERxgHrwzbNTU6aRTmtjnKIlWGtIuHjJl5Wj5bhPsYlh5iuL8h9d/toTuKWuB
 Hq1G8kEJ+9/TtMhChBSyBGmzrTfNIFDN3Epo1Pg2kIQ2TlDWGEineusHBlK6p6XcP4QA
 MqM4ELAkUZGe7dB2o0dblpr4Jcwo6Cgkgt5jSJUwT9rF56CHKInVPLga36RZSYVY1mQA
 Dh9rqPvWm+UYPtVno2vdGEig2dhxJj7Pw7JWFBTnh74ny6LLYI6DABtyn4lHbJCUvTkl
 QrJjuK5OPAtlFdg236w0tlJ9arffG/2r+hCNm6jHyIlqcbOQU5UY4b1e1lSxmm5Fqh3O
 zYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947419; x=1733552219;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SMWMQmaQNFbs3p5wPSSszQIsEvcT+kEUXSJDlAfkhFg=;
 b=NcgVQ1A/6FAHpCe8HpcRl78THY1rjviaYHFi2kI/haNHwEpGK7pXzXQWAfssJuM42V
 xCVBFMC1B1YDReSsnAKYv1g66L4NdOhlGyCM7FJQca0HRhCnrIVVB70vE09UU7j592EP
 07IrEFWmM71RrlqgX5yZcnldvgJFcyHvDVIvflqd8veXHs1MNktNmP4SUFLLqXkjzpS8
 G/Vs8TYvl6OOUtQ8XH4HhdelcIGY+pt+qALUiTR5OyU4C1iE5W41effqEn6nGohcaweU
 yoHnGzx0GwkIRn4g+qVQsUmrINc9WO0GoSRwCJ5+Je2Cy68xe01CeFsIo6QDb5FlCZL5
 QjIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqaIq+bbPvaO6dsYZLIJCaLvYVSQgxjsah7ZyN/9vFr7+SfaSccR9FbqaLNYbXtSdGgwfIVFKmzg==@nongnu.org
X-Gm-Message-State: AOJu0YxDfzZFVSqfQAwghTAWLJ8WPuQhQRdCwng23IPq1WFJW69pG6Rf
 L9m6yl/TwUe0vKFu2t6jlEOAWZ6bL+Q055RmH9xWsVtffp6pWQGDZoYg6a/LUyo=
X-Gm-Gg: ASbGnctIOUOo85gXSt6GkVyhLrIXAFn5w7E0aP1boFdbH00YzDKgLHZS7sfLFUCRZyf
 nj43/TSgQTARUuY7XeuX011jbqOB78Us0q+pl6iMwb8BoVcB5msIcEJJbqbq61SKXcGmjvbq1VF
 vhmxNmAtP4S0W0gqIRsuXn33Lg4GLsypKjypsySXIeNPFeqQDkTU6t9Xy7EzxIrSHSDtyEMMJVM
 DzXN+NuR8Gxpy6n4BblobwmdHuOCqfw87BvPXjCWnKphGRn3hniNaJQmiyJOeY=
X-Received: by 2002:a17:902:e881:b0:20c:c086:4998 with SMTP id
 d9443c01a7336-21501f622a5mr127905335ad.55.1732947419396; 
 Fri, 29 Nov 2024 22:16:59 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215475446e0sm19259595ad.92.2024.11.29.22.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:16:59 -0800 (PST)
Message-ID: <68b1a9fc-3a73-4c6a-92df-af69d20ce59b@daynix.com>
Date: Sat, 30 Nov 2024 15:16:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/15] hw/vmapple/bdif: Introduce vmapple backdoor
 interface
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
 <20241129152506.59390-12-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-12-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
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
X-TUID: qMZ+2r7vQwEm

On 2024/11/30 0:25, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> The VMApple machine exposes AUX and ROOT block devices (as well as USB OTG
> emulation) via virtio-pci as well as a special, simple backdoor platform
> device.
> 
> This patch implements this backdoor platform device to the best of my
> understanding. I left out any USB OTG parts; they're only needed for
> guest recovery and I don't understand the protocol yet.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
