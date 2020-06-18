Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1603426lfm;
        Thu, 18 Jun 2020 05:42:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc0EQ+8+fohwky9PB6Bu2eFsw3vi8OmV5qEiBsWl0fwgsJ5yKGuRxnSPGuHHFNcm77cjmm
X-Received: by 2002:a25:ab12:: with SMTP id u18mr5860412ybi.142.1592484156581;
        Thu, 18 Jun 2020 05:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592484156; cv=none;
        d=google.com; s=arc-20160816;
        b=fpSJSwLS/sjgjyvJBZJkbK5QE3W0sHLlPsxaBvSqgTWsmp/XFsGS3b4H5+8RRcMwWl
         wfdWu8BRYkdNOWcaV6TKr3IRdfvgCVMe1LhTP/0ENMsr35TiI+KiEKGIT8IAhWnHsRku
         fMl1tksH1cbVfUZj4MjM1V8wYKhyHUBWDlEkZ1SOP+M+0bBq+Gz4wQHdwsZK32b/bZMV
         3k3znuEigjsQCCb9L3p9H4Sf0T/yKttZAiD/P+U4KDpyKmSvwGG6mT7sKQAIXDfKtb4K
         HIH3AnKzretTnpcd3CIYRaXmuzGKbBK6NJ2w4z0fiEn6Ki0U15dhnCPKroqhLpyPBgwf
         0XvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wbfrvjeMUBsBLid1SAXl9n5HmExSLF/DIjsM6+S1eWg=;
        b=u97HOtxybi5hUvMDz2z87YN3+ybq65Ng+SSGTbgt70iwsh8CkzleXG/mQlvicG4OA+
         qEQjqiYDeREmG66tatHz/oIqF2sLswLz9m0Qc7+uUB1e1fqmmpe7mgoM/JbwqomrNz2D
         3MROfk2AO7lH2EP8NNA5SXLB2O5wjyfG9hQIuLUoZyM1YJibTitMyy6gheyt0hbfX/qJ
         FJDKoQ8E+59JHrIHSLEabUjzk5JVwqE1HKBwCQY5c/INRnZWgEQToxWCssjJYCZ2O1AV
         q25f+5UCnq9FxO/fpnKGXNUE5op5Wo2daHmHJqeXJIt3YBcM7MI1agWt2/4JEd7kOxGw
         FIwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VF3jYiam;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si2472357ybi.459.2020.06.18.05.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 05:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VF3jYiam;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jltsK-00014v-0T
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 08:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jltsC-000133-02
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 08:42:28 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23354
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jltsA-0006IP-8q
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 08:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592484145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbfrvjeMUBsBLid1SAXl9n5HmExSLF/DIjsM6+S1eWg=;
 b=VF3jYiamkzOXNGlngfh5/kmgiqo6m1a6SVO3l5MqKFEMSTVqYixJ1qq3D45Zq2yzfg4JAC
 CQUgcDBRiKACwBbgiEZCu2po8tFZr+pTQcqrlc8ZHO07jSjkFqZMC52JsdLin0PaIL9igO
 95nxayihYXkcFUtPbniRZ87dwXle7CE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-OawsEvVnOWKXzj9II0z98Q-1; Thu, 18 Jun 2020 08:42:21 -0400
X-MC-Unique: OawsEvVnOWKXzj9II0z98Q-1
Received: by mail-wm1-f70.google.com with SMTP id x6so2532498wmj.9
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 05:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wbfrvjeMUBsBLid1SAXl9n5HmExSLF/DIjsM6+S1eWg=;
 b=OplEMUCXKhEM/9Uf9k5ojiWkHGJZjKGUe2Pek9Erwu5xx+dj9xwyAJlWFggK+NiljX
 GF5mEWIwCIUiXPZAhiO9rnroqhijET4l7yVyQwaYyt1idMP7CVZEXnUGIaJWxhuDhlxZ
 UTNDVD30ZmD4EjqgMgDsvYnZjvRQb4gCcSoqZfCZbDqdWTu2fyk2I5njO87UtcGQzcqP
 YrCP90HOEdMX8Qznk1vxg41kfke3CsJiBo4kW1AxbGTohuq48Wm23i2L+GTxcHvChoL8
 q5XSknF6lLvdE2hg6Cp2kKGZaQAz3Hu4nigh/8d+qGZ2Y4F5QCwwu00BTIxnJpXT7YzC
 ogMQ==
X-Gm-Message-State: AOAM532uiNG0UdX96tG2G/W5Yq7SHp4dVhAwzRKsdd/DwPzjFumqVZ3e
 pufiQ6cxAVrmUulHCzdJYQdDgvOWs3tcwuJpj9GFhFkBM3LnrinYkJZwbHh2Z49PtI5xQCLhyy7
 hz234VveDdU6V
X-Received: by 2002:a1c:de55:: with SMTP id v82mr3853103wmg.148.1592484140867; 
 Thu, 18 Jun 2020 05:42:20 -0700 (PDT)
X-Received: by 2002:a1c:de55:: with SMTP id v82mr3853081wmg.148.1592484140654; 
 Thu, 18 Jun 2020 05:42:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e1d2:138e:4eff:42cb?
 ([2001:b07:6468:f312:e1d2:138e:4eff:42cb])
 by smtp.gmail.com with ESMTPSA id e12sm3503089wro.52.2020.06.18.05.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 05:42:20 -0700 (PDT)
Subject: Re: [PATCH 0/7] misc: Reduce QEMUTimer pressure by using lower
 precision when possible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200616075121.12837-1-f4bug@amsat.org>
 <b6170c76-27d3-c3b2-e32f-427fea769350@redhat.com>
 <df330613-a75a-5d3c-5290-c080f5c32785@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <80230616-1927-e861-98f5-b9aaf2fe03b7@redhat.com>
Date: Thu, 18 Jun 2020 14:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <df330613-a75a-5d3c-5290-c080f5c32785@amsat.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 00:57:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 David Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f9YFmVlsf/Xp

On 18/06/20 14:26, Philippe Mathieu-Daudé wrote:
>> This is in principle a very good idea; however, util/qemu-timer.c does
>> not use the scale to coalesce low-precision timers with nearby
>> high-precision ones.
> IOW this doesn't reduce the pressure, but simply makes the code easier?

Easier, or harder depending on the point of view.  The reason why scale
exists is just because QEMU_CLOCK_REALTIME used to be millisecond based;
having to scale based on the clock was really ugly code, and furthermore
the scale provides an easy way to switch timers from one clock to
another without having to modify every deadline computation.

One might argue that the scale adds to QEMU's cognitive weight for
little benefit.  You might counter-argue that having to scale up to
nanoseconds every time is a pain in the ass, and I am not sure which
side I actually agree with.

> Only the cover mentions 'pressure', so maybe the patches can still be
> reviewed/queued in their current state?

Yes, of course.

Paolo

