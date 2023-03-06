Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4373566ejc;
        Mon, 6 Mar 2023 00:06:22 -0800 (PST)
X-Google-Smtp-Source: AK7set9iP+ts4/cj7skZCYV34sbokawS/le6gIdlVy+okRP4F4GLh0K49C0/vcfc7Al2Mw9MG2lN
X-Received: by 2002:a05:6214:2426:b0:577:5ed6:3905 with SMTP id gy6-20020a056214242600b005775ed63905mr15852848qvb.23.1678089982533;
        Mon, 06 Mar 2023 00:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678089982; cv=none;
        d=google.com; s=arc-20160816;
        b=qvzqOt9wOkac0IgEk6ui3vJkFbNjUtFnF1/50XeqCk6LBOBUIVD/ujtoMOme7vFXVM
         mPUZHx6VFfQ1E6fsqTY4nEmwlHlGQS71ifUT/pLcbyibiIQbkuP26Em5w/WgcIy8oYAB
         KOXGXBUPi79q06e94YTzzj/6wdgcAXXIgDrnocNhE1MyFLDuk4FiK0/+Harii8sdRTZj
         98L/VY8w+6ik2vGIiBDAQ1pnNxYPMuUA7pUVDtqIB9OQWOSghDg4ho+W/z5EqhYl3GXc
         7LtzLFSpaYm0Xe5n4X3jweiXXhc8u4l/7Xmtbzh76LFFwudqh881LT5i6DRg/TqWuZiY
         hjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SFXmeCBxn8HWQkQJSm8XTc+1vZw5W6c2ztuHcxJr5gE=;
        b=uAcBK8vy7YyfMtrYtU8h7YI4B+jQxcV+60Qb5P36x2dMGea4qilut5GQtsUGETmGpY
         0+unjyFp4BAL74M+uVdYW/yoR7HKj9AmR/mQ3qC/0uUhOWVBWNAD1M6dCjHb00ZpUBxg
         Z7HtSYRkYhQBBYEb6o/odPG6uAr8tDAiwWAedYQmDjMh7anFizanCv95xJoPH6j5j+J8
         XWLxUuev7BlZtA2btDZDjGSRl0JhID4lbbzRs6+oyQm2M7Vj1qbxyMziaV+LBrtikCW4
         rNQjsk5nsvuq5fMRDtUalc3jxahiscNXVr3V4qU3xZcFNW0EFa6665H0VyWPoAWiJRit
         iyEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HSAN57Wt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a05620a048f00b0072cac0a4647si6060419qkr.250.2023.03.06.00.06.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 00:06:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HSAN57Wt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZ5qp-00047v-01; Mon, 06 Mar 2023 03:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ5qC-00040q-OC
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 03:05:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ5qA-00066u-Nf
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 03:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678089901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFXmeCBxn8HWQkQJSm8XTc+1vZw5W6c2ztuHcxJr5gE=;
 b=HSAN57WtlV5USp7qQGITeGSNn/5GZ0WgFp/mvpdkmbHtd7jyBvT4/pn1Sjcb4eLF4iz8Tt
 vxacqwFBTVg8v1ZW1y4wuXNV/y3wPABCidiwk2KYjItDhLvVhsuAbUkVQyEry24mubLIvK
 SdgeSamA3FlCeOgJc1cxwNnaQwwIaVk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-Qnqi7bxUMn6IaDd2xeiuQQ-1; Mon, 06 Mar 2023 03:04:58 -0500
X-MC-Unique: Qnqi7bxUMn6IaDd2xeiuQQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so12358826edc.9
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 00:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SFXmeCBxn8HWQkQJSm8XTc+1vZw5W6c2ztuHcxJr5gE=;
 b=14xawHxeIV2mkRhNXL6DkyqbuQyvI88whXRyq+Dv16W4w/I0JglIm1xspavwVlNrpa
 3PUPlu6OSWlycBz8g9e0SxiiXQk3/YjaJsWs7u3NxNlTDVh/qBa8i+ZJXXOqm0QmKH8s
 8XpMZO9SxiH7yraa2gEtEUNPy/peDoKbPPwC8cLto4zBGoYJeKmclKbMWDiRj0A7wZLN
 vtHktGsDeMcmUwUCjqWZHCvQEL6bjp7JiIUbsUxU7ObRZ7vA100zHKEzgS8hA8dC2WXg
 VtSmjf4Uef+7HRGtvN24o6buallRZ7LyUBJTd1qIkECMp9r9RfT4PkkgDYfZjveCDESz
 ENtQ==
X-Gm-Message-State: AO0yUKX0OPKEOAHtzF2L+AmZ0dBm45znQasQSOxD/OUN0gmeuXVUBslL
 JXVS130UnnUPWH+FioDBGepTS4Sbefh3c5PWKgN5MNHeabjPXvuEXnGE81pHOljBoDj+V/yqwc3
 QvI1UkXdL6ewk
X-Received: by 2002:a17:907:80e:b0:885:6a2e:f941 with SMTP id
 wv14-20020a170907080e00b008856a2ef941mr12576646ejb.54.1678089897159; 
 Mon, 06 Mar 2023 00:04:57 -0800 (PST)
X-Received: by 2002:a17:907:80e:b0:885:6a2e:f941 with SMTP id
 wv14-20020a170907080e00b008856a2ef941mr12576615ejb.54.1678089896817; 
 Mon, 06 Mar 2023 00:04:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a1709063c4900b008d427df3245sm4232381ejg.58.2023.03.06.00.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 00:04:56 -0800 (PST)
Message-ID: <cd4d82c4-6161-493b-073b-235141d6337a@redhat.com>
Date: Mon, 6 Mar 2023 09:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/16] win32: do not mix SOCKET and fd space
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <CAMxuvawu4EWKpw_8sHGU-hVKeX_wZzpWqaRJo6kjbkYB45VWjw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMxuvawu4EWKpw_8sHGU-hVKeX_wZzpWqaRJo6kjbkYB45VWjw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: Xp6CVZUBwS44

On 3/2/23 15:09, Marc-André Lureau wrote:
> 
> 
>     v3:
>     - fix closesocket() to prevent CloseHandle() from close()
>     - fix direct closesocket() usage (#undef closesocket before)
>     - add a test for &error_warn
>     - add r-b tags
> 
> ping  (I am missing reviews, thanks)

I'm going to queue this series today if that's fine for you---thanks for 
reminding!

Paolo

