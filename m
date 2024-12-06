Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp873615njb;
        Fri, 6 Dec 2024 06:13:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXGQQd9WaBSt/bou9La+2O3uXP+J9zsx2Y152QF4+QzwhcLrPgjv3Lsu1EOJyINHvfZgjQgkqmPg6suYg==@linaro.org
X-Google-Smtp-Source: AGHT+IH4dJutp6WBpADBQDOcOqXnN8cXi+s1b57jxlQd0puTXAjOryHI6aWrRzc9hqz2oCM8J+cx
X-Received: by 2002:a05:6102:3e93:b0:4af:4902:153e with SMTP id ada2fe7eead31-4afcaa284e4mr3473164137.9.1733494391095;
        Fri, 06 Dec 2024 06:13:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733494391; cv=none;
        d=google.com; s=arc-20240605;
        b=hszhJAOhvP6w4Xe86X0aIeDJgJvJJF1pEXQD4kGf31J6oiEz4vdYuNNkX5Q0UZOeyu
         nH19NQs2Uv9AZnD0R1b4IjdpwIBvHj/81XiNpGIH7iBDXEq2QUeDI4Yw6Xuc7E6qh+K0
         K2ux7sDhEqAAexm0itlYxxcqxzoEBp0iCXTBFdOTC8H1PB1W4m9tYKOP+tMyTnUm/1C7
         3dMhEX0XwkdMIaCuuXOa1lFpwBy6Kt3kuiOghBZTwBXhUqTR68XRrMdISnqIF/V+Psz/
         NjVms1E/VmCSFbtsoIi8QHdSh9GFuc3vMZg3OyZ/j/DwlEbxrpv8FV3ju203wt7XYgBD
         SV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=gR6nbMx0FhfMaQyizomsjdHthGRX8GCdyUQO/T0HE5E=;
        fh=s5oDVFFdHJitRDUE7Zm9rWNGyIRRPq0YQZXbe3sIANI=;
        b=Sdg5chffMyXIXqN11i3o2FWtXIEsoar2vahaw6KoCchO7cvWdK7q/2WsfitoN8Fsx8
         VYXFY6V8QhDBn2qGozQjF+1nEvrVx8aD6jaspbUC17SwV/JKFWgnw1z3I1+w7M9ORjlK
         yLalZ6QJh/XVmthLjv2LmL9Hz+3HnWx7Ov/Cql9GGFLBKWTi792CYIBZgVP9lWVJcwqs
         4AaqGtJ1de4Hm7cLsCwheXlMw28e+kjgl4FBXqQVeipYEFomJ01zidnEPeCvP5qFA83u
         EgNxKWIM+WE800bCPgNHHR8/d2ljhA2KWSyGtGoENc336OOae5yjNyVHjf2pMHzFaNgk
         PJIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U4HB7rJu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afd99da98asi136520137.400.2024.12.06.06.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 06:13:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U4HB7rJu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJZ4c-0004Zi-Pj; Fri, 06 Dec 2024 09:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJZ4c-0004ZO-0u
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 09:12:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJZ4Z-0006Pp-Vj
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 09:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733494366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gR6nbMx0FhfMaQyizomsjdHthGRX8GCdyUQO/T0HE5E=;
 b=U4HB7rJu+89/5vvCuiP76sfeNCinSC9TcPVf+ttNG2IWcHjk5tDLYmjYBEjUuT54MgOF5/
 hQoajqSBEDUQXLxGIQncDsTwXJylDfTb42jf6yC3kRTpkQZxKMr66VZrHeeb65LGpdRKiK
 va00viiCwbYA/o0S7OIUGQsoXlJ9xzA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-nlFE1c3RMTCojScdikr_wA-1; Fri, 06 Dec 2024 09:12:43 -0500
X-MC-Unique: nlFE1c3RMTCojScdikr_wA-1
X-Mimecast-MFC-AGG-ID: nlFE1c3RMTCojScdikr_wA
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-53de3a4752eso569939e87.2
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 06:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733494362; x=1734099162;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gR6nbMx0FhfMaQyizomsjdHthGRX8GCdyUQO/T0HE5E=;
 b=PCdziYrEMEtpzNxFz51lTJ/6vz6HV6niWrJ7z0uI/GeTfNdaYJVG/8ILQPw0NjgX7h
 WpzUMKbWAO2xUT2QtNF12bd3vu2zCe4zw5IGrgkC8OF91CpEGFExw1tM0UK7iv7Bxojv
 yq2GTVAqsfXVHZ1GAD8oo3M8QkeWPSrN4mpDUOgfBLah/VgJfUpftYj8JTSOKb6PUO+k
 Qs8V8ZHdQcV+FQVRYmVLMe80vtGTfQPWcnMDBDIfNNjuck/yMBtp/6V2DO7KUj/lBQRH
 prB+CD3KOrxegUSrSggX74TLnUhVuKj9lvDmuxednD0p3MOSObx21Cf12moUisjK7qWz
 cMHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWjnctCRV7rNULKkoYl0Y4l89y6E0gt7VXURBVtHoAA8+gqmvMrk0JOOBjaUIdpRIs44JBYqWl9w==@nongnu.org
X-Gm-Message-State: AOJu0YzBBopZI6sS28SWYwx/RIdkiISogAP9uqJo9e65OAoLNnQu5623
 ZLyXTuduFZnn0fg+ivkclByyfZrE7TD5/yIPHtsZVh0p57j28v8qwdEkfSuHTvMjWi1aogMq1yQ
 caKO4vn3s675zwgHpT2Yc0PBB1jITUHLqh6R6DoIZqibxELILmw==
X-Gm-Gg: ASbGncu8RIaUAxwEoCXOUO4K/qioOO0UMr7sb+SMM14CoRjEL6kRzP1VxnRp79iWD4A
 el2HtaXT4W36ZEECaXTM5BDRTje3t0FuUEIm+Scvaxdo06Y7/JEHFTkOUh8iIRWO1xO9+hDgqB5
 ebpEHQR+yomdBTfIT/K2pRE2Hd1jKOYSxIUZ7F0TXL8ERLJxYVQPBFatJnYyqwT2nSGT3Df+6rq
 y2n0Z1rW65S0Yu7Ef/Y9XtRa+NhXxbhk28TMzh+Gi9mTjHk6d+Fngq2PmbLGnlZmXXsEOQ8egoz
 r01zWA==
X-Received: by 2002:a05:6512:2209:b0:53e:36ca:6578 with SMTP id
 2adb3069b0e04-53e36ca66e1mr1237752e87.43.1733494361755; 
 Fri, 06 Dec 2024 06:12:41 -0800 (PST)
X-Received: by 2002:a05:6512:2209:b0:53e:36ca:6578 with SMTP id
 2adb3069b0e04-53e36ca66e1mr1237730e87.43.1733494361394; 
 Fri, 06 Dec 2024 06:12:41 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-244.web.vodafone.de.
 [109.42.48.244]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da0d2698sm57429255e9.8.2024.12.06.06.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 06:12:41 -0800 (PST)
Message-ID: <7abe6bf6-b7b7-40f3-8927-c936f1b1e44d@redhat.com>
Date: Fri, 6 Dec 2024 15:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] tests/functional: Move debian boot test from avocado
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241206131132.520911-1-clg@redhat.com>
 <20241206131132.520911-8-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241206131132.520911-8-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xbdLTiDwCVmshRZRAtrDMzOxiF6JfjNiryZhDal3ack_1733494362
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8H5B12MYPwMm

On 06/12/2024 14.11, Cédric Le Goater wrote:
> This simply moves the debian boot test from the avocado testsuite to
> the new functional testsuite. No changes in the test.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>

