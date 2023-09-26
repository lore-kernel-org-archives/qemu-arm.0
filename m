Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1166259ejc;
        Tue, 26 Sep 2023 08:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb2ZwzbdsFfo54uh8HEr/JXwGPYN6s4f03O+h4K/nAf2OTQqr0drhls1npPj+YMDEkcaDq
X-Received: by 2002:a05:622a:18a1:b0:410:99df:688f with SMTP id v33-20020a05622a18a100b0041099df688fmr11917255qtc.12.1695740866035;
        Tue, 26 Sep 2023 08:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695740866; cv=none;
        d=google.com; s=arc-20160816;
        b=09I6R9O14Oy7qdnVl/A5ay6cvCsq7kn1VX7ZtN2prxL/MIhQw6um9KKUE8K3w+O547
         FQpr7ANv2wR2fOeJZh1gbkM63eNNjWX3HRmsi0Fu657uwpnF+xd+lFKiFzi2Ke7oOK2N
         5SGEttU8ZUJTOm1aTaTsdyCVmMB8qKuUxuBMSeS/Nv0jrVPpdiUUHdGJDKY7TaifBQcI
         PClUsd+ul32imyLKDDwx+geOfNYrKk5gFiusr+vPJ2W2Xz3Ov4pz2TYpHZg27Qj+15dt
         fqA1miGmHpo5yxKTgh+MrEgkG0COPnv3gBsGI1rSjHjk4bH+U8EoNjeumi5LXXahjCUq
         gbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=e3vjynd3HjjoyrT8xdu7gF7+aWjEJ1r/2W3goXO8M5s=;
        fh=uM169AtInUOucBzgcl/S6Q8QNPD6R9MmBsZljHHnV50=;
        b=bTQVEtSvYczK9OikMadI96XGp6dJRED0kUF5lmDEGbPfm+6Hztlfo3oRllC8syBKuz
         nnBY5TKOv0Dmt19xsqG0HP9KFnw1uLYCRchPQS4MT4MVuT2TUmA3tMjtTBl+6Zhbqlid
         cWyflq2USGdjaROxhRg00US3QG7Y77cu6C33P7Wt25nwoyM2tDuAnzCbe2j4HLL468Ps
         w6jlL1DQAyXQoIGBhtQXVLqg+ur7C7i9bFz9NiBjrf/rxuB35pdz0aTeGtqmFzJ1lWGq
         WVRFX5BZggvz29hGmeCfTzE3asFT+w/pb02dlq8I2vxJ9YTyX9gaxBLZfnfWUg4UoFdU
         DYTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MJBFbPhZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a05622a028800b00417cd1d2a6bsi4442812qtw.136.2023.09.26.08.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 08:07:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MJBFbPhZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ql9eh-0005A6-DN; Tue, 26 Sep 2023 11:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ql9eR-00052V-L7
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ql9eN-0003IQ-Pz
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695740818;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e3vjynd3HjjoyrT8xdu7gF7+aWjEJ1r/2W3goXO8M5s=;
 b=MJBFbPhZGeZ1hLUwp4XT0DI/1BpYv/FRBgfZz+JxNqQqdjVRMALV47VX0chTaoLQnJK2kP
 xA38DOoeNxgDewKPgnb0iuNCspMCVfdiyrM3xc0lbKQkT8SDGgWqteyIAl+91zH8rsYzCN
 ZcF5op6M9YdKHqSzUQmyNC14oCPbX7I=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-rWTv6V0pMoGWgZNAr30F1Q-1; Tue, 26 Sep 2023 11:06:56 -0400
X-MC-Unique: rWTv6V0pMoGWgZNAr30F1Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7740829f2bfso1517799585a.0
 for <qemu-arm@nongnu.org>; Tue, 26 Sep 2023 08:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695740815; x=1696345615;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e3vjynd3HjjoyrT8xdu7gF7+aWjEJ1r/2W3goXO8M5s=;
 b=wqXbEQZVJcQ8+HMHh6cQYoWlpTpEr90m1uQTSPphAakJ6w0cerrShPtHO6+oXk4YTQ
 P3ha7O8c2yTT4dIIOxDegsFho8dbqMgwtAJUhGMsUT8BzlFA5SOEsnCzsNsk9BQYPcta
 WjPmWL7pXsznx4tokE6gbBarRNMZyBgz/7U/ua+VJPd5fo+U3/251elB83Nf+UWAwSyY
 KUqAwVrxrZ+Ufgn0hVWowBWF+olEMMpoTl0PDTTIDC29DvWQe2U7D4M46eK8Lj1Yw6Ac
 NkwHcH8biOuNuc7TqS4j4WSn66UtBu+igaCYJy7MS8q/bMR3Y9kh23XVgnmf+Bqteo/S
 8YAA==
X-Gm-Message-State: AOJu0Yy/ti29kk2nz0VuwiTvKY5rkoyVHRfj/+ZNxKFQc14AE3dn975r
 QVXqWE+0DJ3V3MNdSvKbRBcolinYZ15liBLiCiijCZEZAhVIPDNcsXK/X6bBnotHYVnH/RsEwnf
 +IZmYl4Ccw4enYLHIGaa6
X-Received: by 2002:a05:620a:4cf:b0:76f:456:3916 with SMTP id
 15-20020a05620a04cf00b0076f04563916mr9620175qks.43.1695740814821; 
 Tue, 26 Sep 2023 08:06:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4cf:b0:76f:456:3916 with SMTP id
 15-20020a05620a04cf00b0076f04563916mr9620154qks.43.1695740814502; 
 Tue, 26 Sep 2023 08:06:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05622a010600b00403b44bc230sm4672594qtw.95.2023.09.26.08.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 08:06:53 -0700 (PDT)
Message-ID: <4c1f3eb7-8684-c883-ccdd-d3da17de03d6@redhat.com>
Date: Tue, 26 Sep 2023 17:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] hw/misc/arm_sysctl.c: Avoid shadowing local variable
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
 <20230922152944.3583438-3-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230922152944.3583438-3-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f0itlEGCNIFh



On 9/22/23 17:29, Peter Maydell wrote:
> Avoid shadowing a local variable in arm_sysctl_write():
>
> ../../hw/misc/arm_sysctl.c: In function ‘arm_sysctl_write’:
> ../../hw/misc/arm_sysctl.c:537:26: warning: declaration of ‘val’ shadows a parameter [-Wshadow=local]
>   537 |                 uint32_t val;
>       |                          ^~~
> ../../hw/misc/arm_sysctl.c:388:39: note: shadowed declaration is here
>   388 |                              uint64_t val, unsigned size)
>       |                              ~~~~~~~~~^~~
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/arm_sysctl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
> index 42d46938543..3e4f4b05244 100644
> --- a/hw/misc/arm_sysctl.c
> +++ b/hw/misc/arm_sysctl.c
> @@ -534,12 +534,12 @@ static void arm_sysctl_write(void *opaque, hwaddr offset,
>                      s->sys_cfgstat |= 2;        /* error */
>                  }
>              } else {
> -                uint32_t val;
> +                uint32_t data;
>                  if (!vexpress_cfgctrl_read(s, dcc, function, site, position,
> -                                           device, &val)) {
> +                                           device, &data)) {
>                      s->sys_cfgstat |= 2;        /* error */
>                  } else {
> -                    s->sys_cfgdata = val;
> +                    s->sys_cfgdata = data;
>                  }
>              }
>          }
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

