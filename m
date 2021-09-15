Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1427571lfp;
        Wed, 15 Sep 2021 00:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD/SodsjqnYR5rfiA/y1+ViKfbA7sDO/zb9suIHg7yCnXX/h+jsrcE6ROV1C0RTnq3t6Kn
X-Received: by 2002:a6b:8bcf:: with SMTP id n198mr17445464iod.178.1631691792969;
        Wed, 15 Sep 2021 00:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631691792; cv=none;
        d=google.com; s=arc-20160816;
        b=GUiqvPpJaChoZHDj3a+zFkCaaNI5Xx7RUOPFcAEymxWeuPJVol0XPgXLtqAQPNlre2
         hUkNzcvIHj/2UX5ey8FJlklSDb2J8afovi/+6zHWVztBH2wMOXcg/VskCF1EHW/Ols3B
         goECOCNu6u1h6t+Aw6FBr5NwcEdKK7bIEXs4QMehOEpf7dG7gjXjAzOBMJSZa93/WYLd
         Jn8Dy1PEoYzar27+3PpB9Po4eT1KkTxDKXe2GE/6robeTto3LGdJSbMVTI5qJ3Qdy+rl
         PtC8ANB9PCYvKDimuPUKctDEeVoCftbfkZ93EuNQNCz/Y5CFYF58gMHwlJ6Slh5Xjxmh
         Eneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to:dkim-signature;
        bh=n7tY2qaRUyAbVvdR/3Omi7aXBnE61Nvj044XCE+czWs=;
        b=VVccJvKqL5KOzY8lduikr4+pwIsJ5e14XMfM0wYBxoNFLB08tTiU7Rpqa2T+l3hWnX
         9TR6suCJNYu/cz+z4/65JMRlEwukF+Aqq+6z3FJcuuJQ914KD6qr9zmbS9qFZhEBOFvV
         /0q8cDCcd0ACqdXMEsO3VuespEg4m2lGHLZNO6CnUuSlofdu+Uz1TZlnLqywMbe7taUC
         RwYhqcTuzab+ADiUHCEzLB5zHS81Jjtgka6qBFftKUnfmKDpg2rMVuPUCXbRq15roQtz
         p6aaMQXM4R7LNCi4WmCuJUhilOh+5knUo0yqoPx+zDD3A+qDfY6Nke1yEu8nOk4C7SMS
         4HAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fefhYrZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si15072993jak.6.2021.09.15.00.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 00:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fefhYrZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQPZY-0001M9-Ag
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 03:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQPZM-0001KV-Rt
 for qemu-arm@nongnu.org; Wed, 15 Sep 2021 03:43:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQPZJ-0002aM-Mh
 for qemu-arm@nongnu.org; Wed, 15 Sep 2021 03:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631691775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7tY2qaRUyAbVvdR/3Omi7aXBnE61Nvj044XCE+czWs=;
 b=fefhYrZU1F6kcV+aspD04Db1FoTvDNDgaFz5eSQQC/hP51aeTRubHGchrBpG+tVT9ajmwr
 K4dQbXUDZOIu6ruA+VQrvdDSwN9p8w7R1HDgHKhESQZu7Bkrn/OvSv+Ig3bWVuPsUO32kp
 13tHNZNtsoKS4r/Wyu3NpI7TRYhOxZY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-Z2uOXkKzNfCRTuCzKqOoCw-1; Wed, 15 Sep 2021 03:42:53 -0400
X-MC-Unique: Z2uOXkKzNfCRTuCzKqOoCw-1
Received: by mail-wm1-f71.google.com with SMTP id
 g13-20020a1c200d000000b00308ecd761e8so1053817wmg.2
 for <qemu-arm@nongnu.org>; Wed, 15 Sep 2021 00:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n7tY2qaRUyAbVvdR/3Omi7aXBnE61Nvj044XCE+czWs=;
 b=rnz8aJ4+p6tHp4Tds0dML2I/2EjaWDQWmC49n3GQuYdVNr/aMu6/Kico3kie8xmFs+
 vFkr9iWAF5wYkeQ8pItT5OzdEkUuAhvsB9T1/v1S+Y69qYAK1defIWKfVmps4MXkAMRH
 9H0LJtJd7MmOw/N0fpFgFA8Cmtx1eVh4Okfgq+s20UaNksWiRBzf4ciM+aJJgJYYma+8
 nNrPZsZFyLU771/z5Syhvfqtp8nnDceUuniY2GracSwL4LdsYf6qfYndjJ2H9OqLphiI
 BjRRgELMhFHlB7SiB+x6ncEqKScThxCWy+sHiaisHIXz3iA5gj4TbWf5DSqGBP7Su/C6
 6gDg==
X-Gm-Message-State: AOAM53257ft+3ADxygPOus67EJuHZnD9tSUJDPRTL3OIFJttHQilMYmg
 AA0WQAM0sMtRG1IBzgMiFyOO1KiqgozgtybBkaCJQY42aUz9xcnctU1hhSnaxhK+7WtDr9knZDr
 Acb5nHUPkZw2d
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr3040301wmd.20.1631691771931; 
 Wed, 15 Sep 2021 00:42:51 -0700 (PDT)
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr3040278wmd.20.1631691771689; 
 Wed, 15 Sep 2021 00:42:51 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-145-004.46.114.pool.telefonica.de. [46.114.145.4])
 by smtp.gmail.com with ESMTPSA id e8sm12952500wrj.48.2021.09.15.00.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:42:51 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Deprecate 32-bit hosts? (was: Re: [PULL 14/14] hw/arm/aspeed: Add
 Fuji machine type)
Message-ID: <ee5d379f-a792-aae1-370a-b5f21582ae58@redhat.com>
Date: Wed, 15 Sep 2021 09:42:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CEo4sN1fW5J8

On 14/09/2021 17.22, Richard Henderson wrote:
> On 9/14/21 5:26 AM, Peter Maydell wrote:
>> (2) RAM blocks should have a length that fits inside a
>>      signed 32-bit type on 32-bit hosts (at least I assume this
>>      is where the 2047MB limit is coming from; in theory this ought
>>      to be improveable but auditing the code for mishandling of
>>      RAMblock sizes to ensure we weren't accidentally stuffing
>>      their size into a signed 'long' somewhere would be kind
>>      of painful)
> 
> Recalling that the win64 abi model is p64, i.e. 'long' is still 32-bit while 
> pointers are 64-bit, how close do we think we are to this being fixed already?
> 
>> Even if we did fix (2) we'd need to compromise on (3)
>> sometimes still -- if a board has 4GB of RAM that's
>> not going to fit in 32 bits regardless. But we would be
>> able to let boards with 2GB have 2GB.
> 
> I'm not opposed to deprecating 32-bit hosts...  ;-)

I think we should consider this again, indeed. Plain 32-bit CPUs are quite 
seldom these days, aren't they? And I think we urgently need to decrease the 
amount of things that we have to test and maintain in our CI and developer 
branches... So is there still a really really compelling reason to keep 
32-bit host support alive?
Could we maybe also decrease the amount of targets, i.e. merge 
qemu-system-x86_64 and qemu-system-i386, merge qemu-system-ppc64 and 
qemu-system-ppc, etc. where it makes sense (i.e. where one of the binaries 
is a superset of the other)?

  Thomas

