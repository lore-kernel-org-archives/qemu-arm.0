Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2216913njc;
        Mon, 24 Mar 2025 13:46:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVveqGScdd854ow3/006c6UJa2TA4a55nrAJT4F+EIgdWKqsE0LyLR+jXgfvZp5IQ6w0jP7MSD/CqeEcg==@linaro.org
X-Google-Smtp-Source: AGHT+IHESTxFQ0xv7HHCagn35FviDFSrQdN9gmvRArpplaWU2QkarBAcVtGWTdCl1QZ8AsuOSz9l
X-Received: by 2002:a05:622a:904:b0:476:b4c9:f4c9 with SMTP id d75a77b69052e-4771de7ddebmr255477971cf.49.1742849197422;
        Mon, 24 Mar 2025 13:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742849197; cv=none;
        d=google.com; s=arc-20240605;
        b=J7We6YThsbqLpEuOor4fpI3toCJSX3aiG7tSs0A2qroJwwe6TUMfy8XZgV6UVjji4s
         0MSNYbM7tyKcOxUuJBfdD31mAe7YkCMTxXKdYB0+SU2t0xPrEztYiqRQFnarBKkxtKH9
         aHMjvie96a0vXIMwf/jjFhEHUp1xGW5m0usL/S1RHEHRk3CVD2HgVp3phrfVsXcRwZnn
         WS1ctwjTH+WQ7H/j3IxCpQ2GyPJTNCPTROG/ft94Wro8OsH+Jut0DjuT8pek3cIfa2/r
         q3i+cBEPvTkeO59lB69QmQqnDSE5omTxKfEDihZqcAZR3mTQdWW6hLA9cZdCHMgqPzgY
         LakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=S5L4+6/vbtfGTA8KMNusrlJJngxELA/9UtveDeNuCXo=;
        fh=47yWv83Hfuifx+B2yjU3GBfIk0Yj70HePjDxMUYXpU4=;
        b=k/9vRgSxoYezR7jYTwZU653eFmBIbzWRfAc2vwNCCg1bz3EBnogDPUfQXCgO9eq4j4
         //NBeW5JshFpNjEh+9JfLB1wDlluwfjYfoyAunSxKuc4ts5mLzfAqrpoXGYsVHGklbkm
         /AWcTEh3m2BbyWuyMLByvVQk/OR86w5QRP+FnBHE9EjH/5aRphhX+Bo81DAk3jOgKnkb
         1BOR05gG2Z6AfmPpFm2ZguKGkVLxJWaW8WFaK/V55mxQQvZke2mdphzd9edWfh4nZjyI
         //TasAGP+SKYetwh4gKQTSl7xbLe+L7hhEDGQxFb0vEZZSR3Cq1or/OrsxX5fTYf34aq
         rtxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gakJd4hs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d50c6a4si81809781cf.326.2025.03.24.13.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 13:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gakJd4hs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twogg-0005es-2K; Mon, 24 Mar 2025 16:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1twoge-0005eD-Tc
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 16:46:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1twogc-0008TF-Je
 for qemu-arm@nongnu.org; Mon, 24 Mar 2025 16:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742849175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=S5L4+6/vbtfGTA8KMNusrlJJngxELA/9UtveDeNuCXo=;
 b=gakJd4hsq8AuRGdUw1lMAPbK6FkEP9+v0kCpMNx81caLJprbZLdpdVw5efDBtfXQbo4L5e
 yInITVz3VgVatMPv5heFRvgZwp0whLfeeOrIzKKGiWxK4eLZ/3F6PvKezfnxFGBY3EPP9B
 YBeeHemKzn7L58JdTuKxL8RRD4o+qDQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-r5Q2AwpSMi-9u4WRo6Kpdg-1; Mon, 24 Mar 2025 16:46:14 -0400
X-MC-Unique: r5Q2AwpSMi-9u4WRo6Kpdg-1
X-Mimecast-MFC-AGG-ID: r5Q2AwpSMi-9u4WRo6Kpdg_1742849173
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39123912ff0so2093084f8f.2
 for <qemu-arm@nongnu.org>; Mon, 24 Mar 2025 13:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742849173; x=1743453973;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5L4+6/vbtfGTA8KMNusrlJJngxELA/9UtveDeNuCXo=;
 b=eMAZgkroJ1MD83gVrFarEizBVt3gSLFI/7vpqAeBMu8v5kbPt5G/o4kHqK8aN1racd
 fvWYqMwe6Fw/CpdqRLmF656ul/ZwcLGeytX/JY6d9ptZKXXDnKr6kd/9KeoXKfN5wFAn
 JNrDAGXb5w2pFe42Xg+V6yh/PsXXMctgRXlm2vTp3w4OEJf+6QMGFepu+98YV2V4Rqcl
 JRRaBnTQPc28QL7Zyd3+BbT1FTJUG84y17dRXxP7W1D6lkd7bwQr8xt4TNI57hbqygbK
 jAXvYA9NkNwGq51Gl04wX2E5R4v16N6TxArshWipEJyGupHeZuETQSJCBsEEB98wjRLQ
 vD7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXlDq4Vo4xQ5UPaC9AJmP08zAreCHzCFKx2Pshff9/ltRrJfAT71B47PH1+i6kZf9jzyd9i6Hygg==@nongnu.org
X-Gm-Message-State: AOJu0YzKbojNKY5BgAMWDtUfpgAD8cRGz/B+s0OJe0M/X5vNoqHwp7rj
 alNfeqPPV7jLmnozookqkW6+GpDMUChE4RXY5GPgDLY+WuHsT5PzcB2IopVjLduV/zvOYlMzsIC
 sd1rhqTix7UdPt1bTd9hGwV6wRvgitY2AwXDSYzyNC/45QMvdyA==
X-Gm-Gg: ASbGncuuVT3j9ynXZUxqbh+1+wUuTpiVfHMra11ATP4pi7XbMPpp5EPQLOzTJs8lNOi
 7P79xnOV8qIHyZpqPX0oAw3bblBqTMjebt6wAj6QZgZ5AXkVRMo+48A87I13MFGcpL+dXwsjRXa
 H8wZ+2xfqg2LYFoFfmZbbP1ZqBh8wI44F46yaoczRS7tbrYUUpeuocfS+7/rA9OBjV75fLEOPY9
 nhDdkndjZxYHAJZfF3j5DaVaN5MfqU2xoF1TWs+VcqFZ4qkAhL0zaWrBs+Vc+rSTJT+e/YIalmF
 E+huc9JEjhXpq1vrQ2lsGCVSmTBbIDMgVX/gpYYehMcmeET6keLhng==
X-Received: by 2002:a5d:64c6:0:b0:391:2306:5131 with SMTP id
 ffacd0b85a97d-3997f93bf86mr11278565f8f.45.1742849172883; 
 Mon, 24 Mar 2025 13:46:12 -0700 (PDT)
X-Received: by 2002:a5d:64c6:0:b0:391:2306:5131 with SMTP id
 ffacd0b85a97d-3997f93bf86mr11278550f8f.45.1742849172495; 
 Mon, 24 Mar 2025 13:46:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:3f78:514a:4f03:fdc0?
 ([2a01:e0a:280:24f0:3f78:514a:4f03:fdc0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b3ff7sm11712442f8f.48.2025.03.24.13.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 13:46:12 -0700 (PDT)
Message-ID: <2616d3e5-443c-477f-a024-317fadb76a59@redhat.com>
Date: Mon, 24 Mar 2025 21:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 0/3] aspeed queue
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250323174541.406860-1-clg@redhat.com>
 <08930285-903b-4413-bd6e-20a14b2d15bb@tls.msk.ru>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <08930285-903b-4413-bd6e-20a14b2d15bb@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xOW1N51rN4wX7Tef2O1kRcjbZ3T4TshmmgzgXsM55VE_1742849173
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 5JRFmo6c9hhu

On 3/24/25 21:36, Michael Tokarev wrote:
> 23.03.2025 20:45, Cédric Le Goater wrote:
>> Jamin Lin (1):
>>        hw/misc/aspeed_hace: Fix buffer overflow in has_padding function
>>
>> Steven Lee (1):
>>        hw/intc/aspeed: Fix IRQ handler mask check
>>
>> Troy Lee (1):
>>        aspeed: Fix maximum number of spi controller
> 
> Is there anything in there worth to pick up for stable series?


you are fast !

- "aspeed: Fix maximum number of spi controller" is QEMU 10.0 material.
- "hw/intc/aspeed: Fix IRQ handler mask check" was merged in QEMU 9.1
- "hw/misc/aspeed_hace: Fix buffer overflow in has_padding function"
    was merged in QEMU 7.1

The last 2 deserve to be backported IMO. They will need some massaging.


Thanks,

C.


