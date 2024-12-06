Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp863669njb;
        Fri, 6 Dec 2024 06:02:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7Loa/1dy8epnTIJyY9t7A71Ocu0tCNg5xYl1jNTsjO4vTojmpX+oOEuwHujMGqk/sTs95I03YukNYWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGNyM4uD+ErGlQov9RrR23HBsdnh+qA+Kkf4jGdfc9q34ox7+WEh80Mf1EB9omCzC6S67gI
X-Received: by 2002:ac8:580c:0:b0:466:8f43:4aa8 with SMTP id d75a77b69052e-46727945dc2mr97721761cf.7.1733493728708;
        Fri, 06 Dec 2024 06:02:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733493728; cv=none;
        d=google.com; s=arc-20240605;
        b=g2yz5ThXA3wgwpTyfijftxXufZk2UENdh+LPSTzkPu2t4pi6GqrNUtytL0wBbzoN5y
         pEC3OFwBVgsofLCoWHRrZoLBni0P0Vsz+RRxIocGRkws9suzep925XA0pxN92s1r/54y
         asjOlEyO+/xuILiagBvXqeTtBseYCQQbDayQGVQ9w/sDo+0FAx6ezmlXWTJbpmIWKO/b
         cWjRFxmhxR3+2LP21FeuQ5+RWSgJO430x4QbLKe0ZlKD1AvMYN64X2p/1WPc8Q1XkcfQ
         TvrzwNL+N/V82RMHOX5cNKZ5pLTqS0jC5y9kJXD5D1t+Fq7ysZNmSp1nCa17eRAxCJKv
         3wJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=vyyCFkF4QFl3r1AxMMtZuuTYpigqjqRD39rurg7KHaI=;
        fh=Zop4639ZcEVbCNS7uvCGflywdnZyBfn5BFGAEtbZbWo=;
        b=XGIdVxfArLnkT2RpBxkhNxVrSAbq04hg1rJNrlkN3Oh4sYGr2xXWVmFoOUHDzpe/db
         06XEeEI3KD1xQllWYOpw0hJ7hdXP1S7tL+UAYlWHIRrRj3bwXQGR5C7mm2Tur78j5MLH
         WMdvI5nGLsn79bcXDvprCLgnPPQd7DrwUhu+hdbUm+i/UI21TNByud6EnSuUYSzt90Zr
         BPtbtWnfeLCeiNROO9XJ0PVgwniRubio7LPfqCwRq2ywRID+AchBP0nW66xm1rmwV5x3
         vg/aYe12+dT5+NJeHeqU4C/AZbIVPyS8sPMW3UQSgC/1+CCOiMOb6uJ2tzClNg1zVxcP
         yA4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ovme3qx8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5aaacc8si438814085a.459.2024.12.06.06.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 06:02:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ovme3qx8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJYtz-0001q9-DD; Fri, 06 Dec 2024 09:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJYtw-0001pP-Hf
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 09:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJYtv-0003cd-3s
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 09:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733493706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vyyCFkF4QFl3r1AxMMtZuuTYpigqjqRD39rurg7KHaI=;
 b=Ovme3qx8PMi/P1Bnl1xBHCYI1sa/EmI5N0Bbl6X8bBURj5Bdzujyo/dHFyjU/YwDujwN7E
 MlwC9LnleEwmI5ms4FUSoIHfbJWYgYm6OyeFjxKBVMFwBEs/0vznT1KKTwhBcjTzT+J5EH
 iurnhMfIvsqWJDT3gM5cecpDc+/c4mM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-7nhpThivMdy0KGI235Q_CA-1; Fri, 06 Dec 2024 09:01:44 -0500
X-MC-Unique: 7nhpThivMdy0KGI235Q_CA-1
X-Mimecast-MFC-AGG-ID: 7nhpThivMdy0KGI235Q_CA
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5d2b7133483so2254234a12.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 06:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733493703; x=1734098503;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vyyCFkF4QFl3r1AxMMtZuuTYpigqjqRD39rurg7KHaI=;
 b=Fef8zmD6gpgaSS8gFXvxfXg87wHL/G+kNjAiiyNQMOjtuVfHhpA10zmFIHc4z96e4L
 F3oyqRIZeAvEpOwaxn7NomwcMFHikpSern1mi1F5jYfQ6sKhGHZLRY0/6F8xBdXxs+6T
 p+97OBlFtwCjFCUnTkAjcHInY/+Ng/quiTXrvTSexoj+TN0RsN94S6yskfqWJz6Hlqzn
 uUkbZw+octopAadfQfszk6BGQe1sGt+BxWclwCRLgJ2VPmdZDqpM89PyId0fJoYv5TlI
 51sIkFVzWStbxeBgt+6AJ4eVphnFin2pH84aJ3T9++gHR825ehhZVL0Jny+uUIiVBlaa
 UHUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ6cCN04snJKBStzF0qsE2O/MnljXT84XDXChPHwMSiNb0BcmKPmvrWjQ8S9v4ijhgYp/Or8W/CA==@nongnu.org
X-Gm-Message-State: AOJu0YyvZUUmebiqInul4BL5RcoU2sJteTkCmLmXucFPxtFrnVkEt1wU
 Pv0ITxduCL3pL9MIla/1xVxV6YtRZdw6Xub2HceBk7DxRZdmz1ydkLDBympUQ7G5ihpMAHBQHCR
 BAbkx83QtYp5SAB+xjakcSqCWwZ7lXon7umDzQxDlHLHncW2V8w==
X-Gm-Gg: ASbGnctUH0d5U2HPhT9trOmIGBJOUP+5zSg8zdIFS9B8I1AEITewKqJqXiZojd7PQBR
 g3AxBe3QaFgBIEDjiqmoD+Q/++5pIxukL8EupFtesmtBWbjkLz1Q8Ku7bhxPhnVwNoWK7Ix5syx
 ODq5j4NxB6NW8Yw3MdwPRb4MHg/P6PnsIzKTclKi4scjCbRNWUQPrhNbwX070lm+K6w6Q8mKM8d
 0I327lNwEEawCdf8Tis5D8eUcfJVqSMRPNDtkQyMuVXNYPifKHOR4VGZ7KqAuVvQH1pOpHU+93c
 d8sIaw==
X-Received: by 2002:a05:6402:2116:b0:5d0:d2b1:6831 with SMTP id
 4fb4d7f45d1cf-5d3bdcae047mr2723454a12.14.1733493702794; 
 Fri, 06 Dec 2024 06:01:42 -0800 (PST)
X-Received: by 2002:a05:6402:2116:b0:5d0:d2b1:6831 with SMTP id
 4fb4d7f45d1cf-5d3bdcae047mr2723311a12.14.1733493700928; 
 Fri, 06 Dec 2024 06:01:40 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-244.web.vodafone.de.
 [109.42.48.244]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d149a25924sm2221539a12.17.2024.12.06.06.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 06:01:40 -0800 (PST)
Message-ID: <f061b3f8-3e68-4a25-90ce-6994d91e65ce@redhat.com>
Date: Fri, 6 Dec 2024 15:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] tests/functional: Introduce a specific test for
 ast2500 SoC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241206131132.520911-1-clg@redhat.com>
 <20241206131132.520911-5-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241206131132.520911-5-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NmBZNeVNpJ-FOrxiKjBOdhaWnceEqW7IP0C8H_0t-fs_1733493703
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: NLzDE4ojKcmK

On 06/12/2024 14.11, Cédric Le Goater wrote:
> This moves the ast2500-evb tests to a new test file and extends the
> aspeed module with routines used to run the buildroot and sdk
> tests. No changes in the test.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/aspeed.py                  | 33 ++++++++++++
>   tests/functional/meson.build                |  2 +
>   tests/functional/test_arm_aspeed.py         | 44 ---------------
>   tests/functional/test_arm_aspeed_ast2500.py | 59 +++++++++++++++++++++
>   4 files changed, 94 insertions(+), 44 deletions(-)
>   create mode 100644 tests/functional/test_arm_aspeed_ast2500.py

Reviewed-by: Thomas Huth <thuth@redhat.com>

