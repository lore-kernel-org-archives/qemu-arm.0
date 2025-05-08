Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp316377njb;
        Thu, 8 May 2025 03:25:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWL83rruz0SWaFNXePmUwq560RNdeoI65li2ZRu5ZKWLe2KAvDQSak3dhAvcNip5H9JBuzKGC9GsHWb1A==@linaro.org
X-Google-Smtp-Source: AGHT+IG67N5IzyJOFCyiOElTWqOJtOQ6d8QnY5tp6TjCJTTSgFhykPuSS1ebyxWWbkuOQx7sPfTh
X-Received: by 2002:a05:622a:598a:b0:476:ac03:3c2a with SMTP id d75a77b69052e-49227f46102mr116028811cf.43.1746699907868;
        Thu, 08 May 2025 03:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746699907; cv=none;
        d=google.com; s=arc-20240605;
        b=gE9PgdoP2XlqHLK+mXt+Ad5DR2hAgScFnnmWWbyqEQkZgjj0YHmoinA1dI/AxAVNLI
         qcFsiXe5hZK/vBLRnsKaR6o0hcPXZXbkU9Ve7jWrg/py8qp0NxEvX1UCYd91Ss0eBq90
         05i/LgkNK8oOVJIljq1xPSBnbUJIWHkoV3dKp4vjARo5354J7S3NdIBSFZs/ybwyMr29
         QirG/zhsd61WaVLhxoPGRij0Igz8BSOgzvM1mNRWHbOi5qBdIKWKT3Rk6ATVsjuUhvBL
         tjyXiki5hJklpdJ6WgBObLT8Oqvk5uiKxqSpdYXHx2b4wxaknHxtOSh+4w6aeCROrmtb
         jubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=nMoIicp3BcEAAVHvQbGCRHgNOEXUddXHyVJKo6VLDcw=;
        fh=Vg4CoS/zKUeKghaPh5LEtOfQQY1Dq9L9XHtzIMgl2nE=;
        b=EHew0DDTL01ax0aBj0mE8HwxFEcnsCySUWuBxurP+DhO+3qwsyZifZZYf6lZNj/eJR
         seOGjPD1mx5CMxDDfZh5ax/cAY7PPLM1eVenam4ILjEeolOV1cSgwGN63kW6zMPvGtbz
         syaPmrAKiLORihcaz/JPDTphKj7dLhNoIs48x+pnS0x3mqqb/setrse5jdGZBUTNmtYT
         fgsHz6/DPuYw1vdEeU4DaQWp37wwl+spbMk2dXP+csuR4CvkLJC0NN4VThj2Q3J/R281
         3xreEiS800Ma0BaSBE4X8MjT6JWc4vINHrdwp/eDHW4NULqkzNCgYRc0xl3ZZnQzRb8v
         hwxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i4nPVo+3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49220f8374dsi41109291cf.41.2025.05.08.03.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 03:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i4nPVo+3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCyQz-0000EE-NH; Thu, 08 May 2025 06:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCyQy-0000Dl-JX
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCyQx-0004ow-2O
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746699892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nMoIicp3BcEAAVHvQbGCRHgNOEXUddXHyVJKo6VLDcw=;
 b=i4nPVo+3yM2xKGPi+W0T5wc3gIrLyGK2E8xmoUg3jBPPP2k8U8xz5vlzMmDSmPH1e1IPbG
 jAFKoGcSsxBqb/eYlh2ANSMbT+Ni14d09zvQegqIzkfByM4IQBKSljmyGpPBCqBTC8RjzX
 lb9hRKVp0rQbSgKSCpvJ8pxJblX4eK8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-JspeFaP6MfSq0ZG42RmBjw-1; Thu, 08 May 2025 06:24:49 -0400
X-MC-Unique: JspeFaP6MfSq0ZG42RmBjw-1
X-Mimecast-MFC-AGG-ID: JspeFaP6MfSq0ZG42RmBjw_1746699888
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-442ccf0eb4eso6062225e9.1
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 03:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746699888; x=1747304688;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nMoIicp3BcEAAVHvQbGCRHgNOEXUddXHyVJKo6VLDcw=;
 b=ZtOzeg6sZ9E0z3uExHjnjKVP1yoZGmGIqMnA0DMoau2q8UCUESzqh4WtClUvIgA8Ci
 GWSmoupcvHHq9KgKIyMTPq5+qRsCUwsrE53hHiRUl/vXqzU+ECEEEWIZwQ06R/+EGxDx
 0sws5PJs4c7qoU4HZSaLL3igfXF+QU7DAJCQta/Aw9tV9V1dOjf6DUvSv5b8WD3sXwhg
 ki9PnhjgSyyGICcN4d+xy3q1vsbTwz+4H19k/L2lwqLi2w1giN2sXMY7ZiHLO1XX+cJJ
 Vz6QiEkDCAh/2uV9M+Uqh+YvHFKBhLOzeKm0ys17UuAkQn5+IpGdX4wKMp0MQ1u6on4W
 3XDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1OxTTkOdJKARTdE1mptPMaQwaFSKaFMcykwY4dEliOTOOgmX0OOTA+zuzZjOOPvJQ3nBqSjLT4w==@nongnu.org
X-Gm-Message-State: AOJu0YwcYXfMlDtq4vcNslvA7C1XtkQS3wjVPfBug6YWN95Uk9VMuYm9
 QRLlk4hYI8QVd3nxr8S2+dAwJuMHZ/msQbLBVHl0tPgcSewDBFdWDeo7WphB0cxF0ZCF431rzVz
 /tN7IEFQoCzEa4ujM+DdK6GTLc9+3m4BFmE0PsIE9krKkLWyobA==
X-Gm-Gg: ASbGncuLwlBClyYVGlJBG6M9rIAGa2IKaV6BIgE9u+woUS38X9rJ4AhN5flvb7C9gcN
 NOqvnXIyV8vR6sPje0MdjK13GffVQLnlf7rBhc5Z6iK6w1spwC5eEuStBm2Phi5GNEc8bVpibme
 l+Ffxuv+UsPozP6kUUpyMFwMLinaDfrh65BWRTmoD2KWX//X3q5TcvB11ObcnExFhJ0FRibOz+I
 Li4jfsRATzgSKIzPWBsSpqvGZDFeqwFVEcxgXpMQO0Nof3CJn0/j04uzPvCHG+BGDcOb3Stkd7X
 vd/IgZnUm/KRh3I6jwwBsC+ErP+j6EuLlf/FfRwxTY9UWY+Ax1BA
X-Received: by 2002:a05:600c:628d:b0:442:cd03:3e2 with SMTP id
 5b1f17b1804b1-442cd030410mr35364265e9.2.1746699888341; 
 Thu, 08 May 2025 03:24:48 -0700 (PDT)
X-Received: by 2002:a05:600c:628d:b0:442:cd03:3e2 with SMTP id
 5b1f17b1804b1-442cd030410mr35364045e9.2.1746699888016; 
 Thu, 08 May 2025 03:24:48 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-115-173.pools.arcor-ip.net.
 [47.64.115.173]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd328535sm32914125e9.4.2025.05.08.03.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 03:24:47 -0700 (PDT)
Message-ID: <c3011d27-111e-47ff-8106-f70b608ba561@redhat.com>
Date: Thu, 8 May 2025 12:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] Revert "meson.build: Disable -fzero-call-used-regs on
 OpenBSD"
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
 <20250508093519.144004-6-thuth@redhat.com> <aByB5B02zxvUZo7P@redhat.com>
 <74e85995-f130-40d5-9832-4bae10ef4e36@redhat.com>
 <CABgObfY5AizhM2rAHypRRqt3rTN=eR4EXZwv7SOemHfLFtUG_g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CABgObfY5AizhM2rAHypRRqt3rTN=eR4EXZwv7SOemHfLFtUG_g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 660zW4XYNcosAchQLpcMQj5gEfA4lrVv4PeN0NR3mNw_1746699888
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
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
X-TUID: 1oahiFk00JKm

On 08/05/2025 12.17, Paolo Bonzini wrote:
> On Thu, May 8, 2025 at 12:12 PM Thomas Huth <thuth@redhat.com> wrote:
>>> We support the 2 most recent releases of each platform, so for OpenBSD
>>> thats currently 7.6 and 7.7.
>>
>> Sure about that? We claim to "support the most recent major version at all
>> times" and "Support for the previous major version will be dropped 2 years
>> after the new major version is released or when the vendor itself drops
>> support, whichever comes first.".
>>
>> So for me that sounds like we only support 7.7 now, since the support for
>> the previous major release - which was 6.x - has ended already.
> 
> OpenBSD does not really have major/minor releases. It just rolls over
> from x.9 to (x+1).0, so the supported releases are 7.6 and 7.7.

Ok, but then maybe someone should adjust docs/about/build-platforms.rst to 
avoid confusion here.

  Thomas

