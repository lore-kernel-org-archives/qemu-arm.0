Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21C8CA0EFA
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 08:08:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqoiA-0004zA-KS; Tue, 26 Aug 2025 04:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uqoi8-0004yC-Af
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 04:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uqohx-0003XM-Js
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 04:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756195622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N346/M2xH5CHPHIm5uVrGAsepZfq/4mg6br+jUGinZw=;
 b=IDlxvMBrmGx6MTQfW3su0TDe2Q218ahAjMxRz9oDx1sb+XQS6Xnl47tmaK5FuUsEs8E5qC
 wu4LV2nVglqshVdZfpeRnUMF3Tpkl6PVSJrq+4P3tc3uoZTcyC4uAkUn/VHgSqqpnG/nX7
 cCYB7xjEk77yyXzwwI6mHcu3ZpvPwBg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-VGlXMXAPPL2-LaZq4by5CA-1; Tue, 26 Aug 2025 04:07:01 -0400
X-MC-Unique: VGlXMXAPPL2-LaZq4by5CA-1
X-Mimecast-MFC-AGG-ID: VGlXMXAPPL2-LaZq4by5CA_1756195620
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45a1b0045a0so35804855e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 01:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756195620; x=1756800420;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N346/M2xH5CHPHIm5uVrGAsepZfq/4mg6br+jUGinZw=;
 b=g1Iv0whDjK4iU9uAp9wkJdfDzVgtBByL2F7VMD6MQc7ghR4806y4qTJbur4jrM42Us
 2/7O2i1sqVJYYl9XRGReAzEzkbHjoHSfMzgVYNGu9K67YdCiiZq4GEgy2AMgoy3X51qL
 EljiCx22i62eso8b+ftpmbsYsiBWkZ57wHCCYXY1cgUDH0zb6OzWCkkZN4y9eR8FlV+X
 8/QGi/hjcPR72eKiPmY3OUfi+FvJI+BoWvnRB2TRERtLAR5opqkJo318+QMn/zt3k4LE
 xvY41V8OIOsCMWHCBhkL96OX0fcHDvWgi6pYrjBQJpHAjPMxqo5xk5UDveYSJsOsiHxZ
 DSFg==
X-Gm-Message-State: AOJu0Yy25u7PV9qcXaUp6P1C6HjekTKKad3HjR4Auri6i/AhHNRS1hAu
 aUPjZwytnbrvyXnpSGZ5xdxY+2x5NJoWajIaq1kl5Cn6uCtWbU4YJFyZrmxbHV+ocO4NGjS3CBR
 est0ojrbYKd6gqj72oiWCa2TcpMHpmFWmNVqu6L2d3/Ov2ryQ61Mqnw==
X-Gm-Gg: ASbGncsGHuKE9yFIBFvN7bUFUaqjO8sOfBrXFEdDjq1/T4P4SXUmH5+bjzvv6xoJQ6E
 UqaRbmnR1Y2Pv+URJpg86qlJNSB0uMEqVYC55EyVufuyb1zI7pCduHMqqmpQmIR9oCtJP6fk+V2
 7LKKThrInrMSZpMhSCpJ7OLxaHcyszKX7j/iQuf22pg6cMPPPCqUeIK7Gwy7o0s9cbupkkVIIVK
 IfOGK+itbdKM7Anv+b0tvYu1wV/QaXrC/bRkcSPxeC+ugTXT2gB2Gm6sVrE40shtW0Rrpwyidbl
 UJKxcC4ThF7e++X101kBOWdGYIIoNKSRgse2cnfFEnTWqfAS4eM7JGbuRv9STF4sf0wJa+EHSt5
 NhfV+
X-Received: by 2002:a05:600c:1c92:b0:458:bfe1:4a81 with SMTP id
 5b1f17b1804b1-45b6193c94dmr53138555e9.17.1756195619966; 
 Tue, 26 Aug 2025 01:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVo0hMlT3clfSQyco23o+4Hg1yX7D0nzF7sKk66rzxR8+hsg70l5TxG4VSeXWfHAKXoPn5rQ==
X-Received: by 2002:a05:600c:1c92:b0:458:bfe1:4a81 with SMTP id
 5b1f17b1804b1-45b6193c94dmr53138245e9.17.1756195619562; 
 Tue, 26 Aug 2025 01:06:59 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-113-247.pools.arcor-ip.net.
 [47.64.113.247]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cad431ea49sm3943063f8f.42.2025.08.26.01.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 01:06:59 -0700 (PDT)
Message-ID: <57b7b6c1-1820-4475-b84a-05b37cfbefdf@redhat.com>
Date: Tue, 26 Aug 2025 10:06:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] tests/functional: Adapt reverse_debugging to run w/o
 Avocado
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-arm@nongnu.org, 1844144@gmail.com, Jan Richter <jarichte@redhat.com>
References: <20250819143916.4138035-1-gustavo.romero@linaro.org>
 <53b6e23f-5328-42c6-9c58-97ddbf3e5b29@redhat.com>
 <a1105fed-dbd8-4223-b771-180ab12e3f77@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <a1105fed-dbd8-4223-b771-180ab12e3f77@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kVYX1W1tOxMASr5efvbWvKAHIX3GRzjTpDZyjNpLwzs_1756195620
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 25/08/2025 16.04, Gustavo Romero wrote:
...
>> Anyway, shifting to a different test harness here makes me wonder whether 
>> the whole reverse_debug test should maybe be rather moved to tests/tcg 
>> instead, where we already have the basic support for the stuff from tests/ 
>> guest-debug/ ?
>> The aarch64 would require a different guest payload, of course, in that 
>> case, so not sure whether it's feasible?
> 
> I think reverse_debugging is really a functional test. It requires GDB, yes,
> but also QMP and booting a whole kernel and the feature itself makes me think
> it's a functional test. I wouldn't move it to tcg-check just for the sake of
> no adding a new way to run test in meson.build in functional tests.

Ok, fair point. But thinking about this twice, wouldn't it be nicer to keep 
the current test harness and simply launch the script from the test_* 
methods instead? You could redirect stdout of the script into a log file, so 
that it cannot mess with the TAP output of the test. Or is there something 
that I missed and this cannot work?

  Thomas


