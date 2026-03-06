Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D013FCB607
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 15:17:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyWvP-0007Jl-SK; Fri, 06 Mar 2026 10:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vyWvO-0007JQ-Qn
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 10:17:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vyWvN-0006Fa-2c
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 10:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772810227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TJgSIOR+KyHj/bksgpQYBE9Y+hEPHXDZrdmWwTGYK2A=;
 b=Pix8Zs10+tnXmP+Y5FmL6nKULD3+exsMkdeHF2q63G5rLem7TnMZO/Q65m1alZAjilCa0Q
 F9Snjeansmzh9FMX7up/RrPAQu9IvhDmHuOu6npFFwpWK1nWiK+l7XeL+6xohE1VawMuHq
 X3o4swvfqGe0MaAfcSQ8yUITjYS8LD4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-J97VKVchMQey4-H8AupgSw-1; Fri, 06 Mar 2026 10:17:05 -0500
X-MC-Unique: J97VKVchMQey4-H8AupgSw-1
X-Mimecast-MFC-AGG-ID: J97VKVchMQey4-H8AupgSw_1772810225
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48379489438so93695225e9.2
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 07:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772810224; x=1773415024;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tR9P6wZJVn3Be7DBqKtwoMlRUtYfRrgjFxyxPPHBdIg=;
 b=pOEROrW6NkngVlRVutECTNU/Yk8MYFs29emtAsTjJmWnIuxX8Dgu8XRagmfG5/cf0n
 8FPMF4XTo1zEfN7DBOyrhZAA3l2Kp31aKqbA6FZ0JNrYilTs8uptMib4WY5ca5zhELQS
 lt/X4BQCSo7Y4TQLKdF47B/nWDdd3GxG9kjcpg/kw+ss4EKW0Or3fdeT7RFHIF68yzhB
 1ikISwz0Y9KQ8OH2pXhBXWPfAYAjmrenjBA7j/tlj0+StIUg2rlE5TTdB5EppeXUEOkt
 MKRAU8uytt7i+FU6pFf9NtiZ8ZpPu7ADLjERo92BnxzlXYmD+TwCfeXzjuS2iY47Ye6R
 mA0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfl2kxVr3jRruQHbA1/mfdxSlXeCsE5zy8ZJv/ROxHAuTuod+nR5ZNJaty0mFk46X09Dh8UbKpRQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywdg7ttz0lFMK8N/zifGqhFV59rQyjVNlwTSAcwMkZIZshe7XyP
 bUMks/az/PND9327MnMNXXaQwkyvjcNOJgUpJx3NuYVVpjaRq7F7MvHoVYdjyooAdz2IE+dyq+C
 NVicSOUiwxFHi3BRiccslp98sgHL0lGfQ3nqpvJRJtmgyEcLEeVrKWA==
X-Gm-Gg: ATEYQzyw4XUU90WSV2ygFas68Z4G+x/yIIH+g4hqVNFLJIA2n5OSvL9IVsRmHxlp0Pa
 5DNnkTDHms2cuFLcKQFt2f+Snyq8tXpbRzPNvR7C1SUvHoXGS6x1XIhWSzvIpQJbzFIwC4PGVhC
 NH5g09PnztRmXsrqWvjfGlphMmsEhsWc824AIwUCYIXZM1mfBaTVZscPYD4Eup0zhTz+N1AKwMg
 nLe6vPFvFnxze1huzpLVdooy2gbwyhPMRp+tpAhYQO2wdiYImHdCNgVRHLqfTYpiT1rx5UkamdN
 3U5FcFJ+ZqYuZLiVCHGFJMlw5xPL+4iUl5JqKRRlTirzDk+BncSCTTliz3wzm28hbSkHr/nFMg2
 fyC3zVWKjbP4uF4eP1jXhT1mA3Coy5wEFrIdiL6Tqo7PZ4Hf68GORlEh0s8wgwZbcnjUx
X-Received: by 2002:a05:600c:c088:b0:483:79a6:e7e1 with SMTP id
 5b1f17b1804b1-48526919935mr36895285e9.7.1772810224555; 
 Fri, 06 Mar 2026 07:17:04 -0800 (PST)
X-Received: by 2002:a05:600c:c088:b0:483:79a6:e7e1 with SMTP id
 5b1f17b1804b1-48526919935mr36894675e9.7.1772810224049; 
 Fri, 06 Mar 2026 07:17:04 -0800 (PST)
Received: from rh (p200300f6af4a490003d6f56739ca055c.dip0.t-ipconnect.de.
 [2003:f6:af4a:4900:3d6:f567:39ca:55c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb4257csm194675115e9.15.2026.03.06.07.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 07:17:03 -0800 (PST)
Date: Fri, 6 Mar 2026 16:17:02 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, peterx@redhat.com, 
 philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v8 2/6] target/arm/machine: Take account cpreg mig
 tolerances in case of mismatch
In-Reply-To: <e60def83-cfeb-4c65-a4c8-44b20f8f17ca@redhat.com>
Message-ID: <10e0b91a-4c1e-e12d-98fe-2c92ffa9a223@redhat.com>
References: <20260304102249.1963784-1-eric.auger@redhat.com>
 <20260304102249.1963784-3-eric.auger@redhat.com>
 <5ddefbe2-3514-fda2-a933-e2df46b4db89@redhat.com>
 <e60def83-cfeb-4c65-a4c8-44b20f8f17ca@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JlSzlY8dWMna8W6dvQI8jUPqlisBs9922QvTJiDmSf8_1772810225
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463806286-824434614-1772810223=:21642"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.411, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.679,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463806286-824434614-1772810223=:21642
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 6 Mar 2026, Eric Auger wrote:
> On 3/6/26 11:51 AM, Sebastian Ott wrote:
>> On Wed, 4 Mar 2026, Eric Auger wrote:
>>> If there is a mismatch between the cpreg indexes found on both ends,
>>> check whether a tolerance was registered for the given kvmidx. If any,
>>> silence warning/errors.
>>>
>>> Create dedicated helper functions that print the name of the culprit reg
>>> and analyze whether a tolerance is set. According set the level of
>>> traces
>>> and analyze whether the migration must eventually fail.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>> target/arm/machine.c    | 30 ++++++++++++++++++++----------
>>> target/arm/trace-events |  2 ++
>>> 2 files changed, 22 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/target/arm/machine.c b/target/arm/machine.c
>>> index 476dad00ee7..13b8a0b2220 100644
>>> --- a/target/arm/machine.c
>>> +++ b/target/arm/machine.c
>>> @@ -1065,24 +1065,34 @@ static void
>>> handle_cpreg_missing_in_incoming_stream(ARMCPU *cpu, uint64_t kvmidx
>>> {
>>>     g_autofree gchar *name = print_register_name(kvmidx);
>>>
>>> -    warn_report("%s: %s "
>>> -                "expected by the destination but not in the incoming
>>> stream: "
>>> -                 "skip it", __func__, name);
>>> +    if (!arm_cpu_cpreg_has_mig_tolerance(cpu, kvmidx,
>>> +                                         0, 0,
>>> ToleranceNotOnBothEnds)) {
>>
>> I don't get this. You apply a different tolerance type than the one
>> (potentially) registered. This check will only fail when there was no
>> tolerance registered for this kvmidx. But this can be changed by someone
>> registering a different type. 
>
> OK so we know the cpreg is missing in the input stream. If there is a
> tolerance of type ToleranceNotOnBothEnds for this kvmidx, that's fine,
> we just trace and do not report any warning. Otherwise we warn_report
> the issue but do not fail.
> Does it clarify?

Yes, it does.

It just feels a bit odd that we identify specific issues when comparing
destination vs incomming stream and then test if that specific issue is
tolerated. With the infrastructure from patch 1 I would have expected
that arm_cpu_cpreg_has_mig_tolerance() can already handle the specific
issues - something like:

if (dest[i] == incomming[i]) {
 	//all good
} else if (arm_cpu_cpreg_has_mig_tolerance()) {
 	//all good
} else
 	fail();


..but I guess I'm just missing smth.

Sebastian
---1463806286-824434614-1772810223=:21642--


