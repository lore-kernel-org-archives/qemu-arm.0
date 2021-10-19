Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp90221lfc;
        Mon, 18 Oct 2021 23:37:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2DriF2Abp313BPTskvfzUPL7RqhIASUTjObUYz1Ey5cU1mToyqL+8AMlhlOBizsNgZG6J
X-Received: by 2002:a05:6e02:1ba8:: with SMTP id n8mr16350971ili.215.1634625468964;
        Mon, 18 Oct 2021 23:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634625468; cv=none;
        d=google.com; s=arc-20160816;
        b=HNaSWawfqHTnwR3GOgQibZEHAv70RMsOmsVwkOl/tCH1oedr508lkcHmxlEcWpHrFi
         trniTgSBwmTNamQL9Ttk1zLc2hbhXf8CqHYZ5VgTXyaRVVyP4dttm6hBR3Kct8Sm0K0m
         sKORPIQgrr+mXjUnteNKxwMMWAwKO+EJKQRxguM9I3+U5K1X7DIF6KFjHuL9RBrGVkfJ
         6cZng74cwofTvFj3dUsueJOKtJhftP8T57Fpep2wr4iRHV16Du7GITK5ooH3a39nrBGk
         5YcvvwzehLJyA7l8o3KYbx8DsMMOlHi4Tt4+u/FjGmeIZHojt0LA9btHLOGcnF8iO6IJ
         acow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rKYniC+Z4LnN/kcvtEwO06pa0oOywxrqa4rY8AeKY2U=;
        b=LxASJq9ERBisq9QCG7qvYBHsRZ4mENgvNm15NugOBPu3iL0LUUBvnTQPRhflsR5oaO
         NbjH+J0yQ9uOnMaqVI7fiboQ6ADq6y6rrm8DQDXC92AO+UHsjJqUJdZaNYXOjbMU3kAa
         Z/CA4xTBalZ8a6zYj/mtbvmUChO89dJB9x3684RyaKbLfU03PnysfhM+tl7RvXYSPVVo
         Q0BOxJMPAvnTo+ay7GE3xREbKdH9/oS7wzPf8gcSU/OlUNHUgrkns4kSNLalmLy7MBGr
         NejX/lcFu+/DHsfcfAgvzRaGuipZ+l55Y9SDPIVqmjJ2wdGhDXO+N+50LVcxvM/wIRN3
         spCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B0It5spk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si16510671ioc.100.2021.10.18.23.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 23:37:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B0It5spk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mciku-00017b-9p
	for alex.bennee@linaro.org; Tue, 19 Oct 2021 02:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mcike-000174-7p
 for qemu-arm@nongnu.org; Tue, 19 Oct 2021 02:37:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mcikc-000349-21
 for qemu-arm@nongnu.org; Tue, 19 Oct 2021 02:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634625448;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKYniC+Z4LnN/kcvtEwO06pa0oOywxrqa4rY8AeKY2U=;
 b=B0It5spkN6vQyZYRHN2SFTsejJf3lv3YQrBIxGHg8eaOuI83kNpq0uBmbpi7rP1F53qNAq
 0BsyJoLE0tof1o5AsP4hC1qweIrCuPhdqB+T3IWzyrN8ScrbzSj1+ZJgJjSmezciiNgV2o
 oiJ7Soio0Nzn481f6iRIhygCsRcGg6I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-b8g9AK-cNRyfQM4_KJOYag-1; Tue, 19 Oct 2021 02:37:26 -0400
X-MC-Unique: b8g9AK-cNRyfQM4_KJOYag-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso504709wmq.0
 for <qemu-arm@nongnu.org>; Mon, 18 Oct 2021 23:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=rKYniC+Z4LnN/kcvtEwO06pa0oOywxrqa4rY8AeKY2U=;
 b=eHwoNicvIPLMu4+ITUDUguSKd7bcRK3BWZzhwY4TK75VI6ohT6LjuwZKMXYkVGTUDR
 JGaI2u+fAUgQwrRd+7iIrbxgQz2JDzpcmWVUrxi1fXamlBs2kxZFWK3KTxxzZ/CEocj3
 5QRVmGFbE7yF6YYLYFsbUzVMx5ojIcK0oTmWbu8wrBgTFO3+1BOc83o/QkbEge4HYBE4
 4gMV5Bj9BeWXX1TiRCUExi5jgpmL/jUiA20F0W78XZVMkNjGdCSrN5F5sBgblQlpNK+j
 bTAGDWsJb89JJ1rzC7xx0T1QF/KnKlKSTAGlUhrcSbG+DtIDS3GIUN5rzDWtBvKj9n61
 9gSw==
X-Gm-Message-State: AOAM5302eJPppXa7PfnyLdjW7cpbxfc7Lk4G+pOCxn6CErL8wulU7g0w
 zx7lwnWbw94wQMb10/2/VaceFcTqnW/nb2GRZR3cl2+VNPrYItVcy4YZNxX4Wse1WP9wjr9w0nw
 TWeAv4SmTZvAP
X-Received: by 2002:a1c:f601:: with SMTP id w1mr3993762wmc.112.1634625445775; 
 Mon, 18 Oct 2021 23:37:25 -0700 (PDT)
X-Received: by 2002:a1c:f601:: with SMTP id w1mr3993747wmc.112.1634625445567; 
 Mon, 18 Oct 2021 23:37:25 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m2sm1371884wml.15.2021.10.18.23.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 23:37:24 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] bios-tables-test: Generate reference table for
 virt/DBG2
To: Richard Henderson <richard.henderson@linaro.org>,
 eric.auger.pro@gmail.com, mst@redhat.com, imammedo@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, ardb@kernel.org,
 drjones@redhat.com
References: <20211007072922.655330-1-eric.auger@redhat.com>
 <20211007072922.655330-4-eric.auger@redhat.com>
 <b7b27eb2-e524-4b10-e5aa-d200f13a2166@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <49d48940-0f0d-c292-3fd4-8b15560c55c5@redhat.com>
Date: Tue, 19 Oct 2021 08:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b7b27eb2-e524-4b10-e5aa-d200f13a2166@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U3ZBzi937qtT

Hi Richard,

On 10/18/21 11:00 PM, Richard Henderson wrote:
> On 10/7/21 12:29 AM, Eric Auger wrote:
>> diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
>> index
>> e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..86e6314f7b0235ef8ed3e0221e09f996c41f5e98
>> 100644
>> GIT binary patch
>> literal 87
>> zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
>> TFmQk+Il-a=3=Gcxz6J~c3~mVl
>>
>> literal 0
>> HcmV?d00001
>>
>
> Something went wrong here:
>
> Applying: bios-tables-test: Generate reference table for virt/DBG2
> error: corrupt binary patch at line 75: --
>
> Can you please re-send?

Sure I will resend asap. Sorry for the inconvenience.

Eric
>
>
> r~
>

