Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp405186njk;
        Tue, 17 Dec 2024 10:06:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQft9p2uEJoMwRNIffRWq3HHwAkc8OORNbA45kE6WusndEgVtC9z8eVFyNsa3b/Qw7cxswL4da86TjTA==@linaro.org
X-Google-Smtp-Source: AGHT+IESH5ckPRjV+A4VRe1d/m5yQFdAujthzbiN9Bk3Bh1jQ39E0jUvMQUhMtgYiY3dTmqm4LW2
X-Received: by 2002:a05:6214:226a:b0:6d8:cff9:f377 with SMTP id 6a1803df08f44-6dd08960000mr5059496d6.24.1734458798798;
        Tue, 17 Dec 2024 10:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734458798; cv=none;
        d=google.com; s=arc-20240605;
        b=VSRz0sjeEadLicEYqLRp6tKZG8A2+XO098WOFREzFdfwTOY4s1OwFyeqmh3t6Zlp8t
         cGPxscvLr73D0/Xwx+8dlLjGWaoqUU3Q4CuzJ7AJFTiLTKi682CUV+G4uOnhdABHOWqY
         c3cM4XkITb1bRE7PvlEcjlIZ7UIrrJNNIUQxyHsqGdKfmZdStVcYgAWsiJWWXl3eX9OI
         6ltrNIukBROFRUwNDlzKUKC02NRBz8viX3pg73WZ9qDRaO5k+NR7SqVL+Hl2NbjJm+OA
         JRhKvpKC2xljS/3d+UO/mrCtxglmhbm4ULWNvole9+VFBySzdktK8JqwzLxJmdNy9rgA
         2uOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nDkviBfNZ2F8uB4fxuvKv5iQl4CHchMQHl8YCgZirPw=;
        fh=ucfadjQpZNOH8w5BVaeWiUps8NwueFuYNreC6NWVuPY=;
        b=b0wHqxul/i2iXI0UJYzBqB5EeFzIzeLJGeL+S7u71BYlt/26WS3h/pd/z8bSg9faPS
         9CujvZuN0nxfKFlpl/OnZ/efa3AePLOaI+7PLE2m3H50nnt/1caCQWTN8CGAHyzgVFSl
         T9YpZFG1pO0otneMUXXtWb7u5J7mEXa1X++KVkCyrqrLuOYFJPnmfaZL+AYjguaGlXeY
         Xneiys0KXuOBt0l33nS+MJkIem5wbTgj7RllcogcNUy0jSF1abQEtunF+9lAFpjrS3lw
         BFPSYTGF9uiQkTCUm6STZfg9Nl09/Vy8D9GEUvmRYsxUeqZ8vUci40OPzthwgbK1I5rv
         6Lhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fUhwhvGn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dccd39afd7si106870676d6.461.2024.12.17.10.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2024 10:06:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fUhwhvGn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tNbxF-0007cp-Rr; Tue, 17 Dec 2024 13:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tNbx3-0007SV-DT
 for qemu-devel@nongnu.org; Tue, 17 Dec 2024 13:05:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tNbx1-0004p8-KQ
 for qemu-devel@nongnu.org; Tue, 17 Dec 2024 13:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734458736;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDkviBfNZ2F8uB4fxuvKv5iQl4CHchMQHl8YCgZirPw=;
 b=fUhwhvGnk/UvBhJVAU5kwK5wXnaIuk1C6OaPqWxS/JwVUzuDXIllljEAmGBghlJPT8N5P9
 V8bjVmqBevwJO5ubE/ZPO3rXoUxmcMmmFWSqcN53V5HeCHwZHmjR4Nf6xiMreBiFUKOOFm
 4jbpuuZVB+53tFiNtapE8lGvx+jHWA0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-tPZEzgkMPiiLObrosDsg0Q-1; Tue, 17 Dec 2024 13:05:33 -0500
X-MC-Unique: tPZEzgkMPiiLObrosDsg0Q-1
X-Mimecast-MFC-AGG-ID: tPZEzgkMPiiLObrosDsg0Q
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b6c6429421so856921985a.0
 for <qemu-devel@nongnu.org>; Tue, 17 Dec 2024 10:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734458732; x=1735063532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nDkviBfNZ2F8uB4fxuvKv5iQl4CHchMQHl8YCgZirPw=;
 b=pyb0h6E8o3USWaX1BIDXTRDdbs2CyGv7XhXt9vDYbd/xxc19Dp2M4KANF7v/72Psah
 DQJGkLXK5x7sNrhgOkC2msu6EFj6MAImqy4vuQZkJRtkO3ZfZq+2GET+61TEzo+dM4YH
 SwfbjvvCT3+kltdQnWrVFiZgKrl3jdrqBjFQwA1Ld/68u6kSI4g8uyJWFQA1zI/ZYdTk
 P9m6bl317Z80F6ZlLaS94XbG/W6xK3pAq7laOCNK/thCwHj5yAgFeo87fx7370DZ6BbS
 uML98HvJBfd6hEWel0jkA66ydBiBQm58zV4fdpvR3lcTotXdnWErjPCsO8p0dwlqEir7
 bVTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKw+yLJXb3J4+pyfai/wZB7SPPBS4FhtfOe1hZ7gNqng/sFgyudqRvxpaIekiv6Koa35wMUVuM5eMN@nongnu.org
X-Gm-Message-State: AOJu0YwFhft8CYfK1NzCPg3fCrpHrWh5GlAlp6t+Nyeu2/begq2c6qnu
 1Ls6hiqo2VMRkfWkloUcxwO1FlafC+XeFf8fq3mn5JmiFn4ND24p5EZSxKtmOU5mEdUxmx5oXs8
 h+oQQL8/tMG2hVZ+VUhEfs8vO9n6tJPwmgv/AF5Rw945YHbrLIbQ6
X-Gm-Gg: ASbGncvCEAPGeYvpVoMJzx5htJhrXFoh7xiIWgv9+swUHJNDMjJN1oorCyVKDDXuPIx
 0Ra12CcIWutuTAZtlFZGOzLgkm5lPp9xs5J1E92A/x+Op0/ieNDY/ovaqADhNoZ8vMGkHhbxEue
 TouzsN1nG1eG0VcGRO7nQczmozq9XIJIO7snJpEi7VPV2BJ2kGQtvl8XE/UauvNc5JSG2DngDpS
 zEcHhZe0vlhx/Yzl5VPDDzp3cNUctGlasMlJ5/bgViLwya4D7FcbdlQRjB2zSv+yJQ9iSn5ImyZ
 kLzrpdHL31ltYloJgP3RXmVJjsyx
X-Received: by 2002:a05:620a:2b82:b0:7b6:6d5a:d51b with SMTP id
 af79cd13be357-7b862614d37mr91661385a.52.1734458732566; 
 Tue, 17 Dec 2024 10:05:32 -0800 (PST)
X-Received: by 2002:a05:620a:2b82:b0:7b6:6d5a:d51b with SMTP id
 af79cd13be357-7b862614d37mr91657285a.52.1734458732294; 
 Tue, 17 Dec 2024 10:05:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b7047f07basm340407585a.62.2024.12.17.10.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 10:05:31 -0800 (PST)
Message-ID: <6f665483-61ff-4a5e-adff-24e8bc1cca99@redhat.com>
Date: Tue, 17 Dec 2024 19:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64 KVM
 host model
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20241206112213.88394-1-cohuck@redhat.com>
 <86r066qqs1.wl-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <86r066qqs1.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.116,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NYHnWzNCt72a

Hi Marc,

On 12/17/24 16:21, Marc Zyngier wrote:
> On Fri, 06 Dec 2024 11:21:53 +0000,
> Cornelia Huck <cohuck@redhat.com> wrote:
>> A respin/update on the aarch64 KVM cpu models. Also available at
>> gitlab.com/cohuck/qemu arm-cpu-model-rfcv2
>>
>> Find Eric's original cover letter below, so that I do not need to
>> repeat myself on the aspects that have not changed since RFCv1 :)
> Does anyone have a branch containing both this series and Eric's KVM
> NV support series?
>
> Asking for a friend...
I have just assembled

https://github.com/eauger/qemu.git
v9.0-nv-rfcv4-vcpu-model-v2

Totally untested atm

Eric
>
> 	M.
>

