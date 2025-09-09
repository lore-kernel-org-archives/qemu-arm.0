Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF09CA0FED
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Sep 2025 07:31:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvsoP-0001Of-Eg; Tue, 09 Sep 2025 03:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uvsoM-0001O7-70
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 03:30:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uvsoI-0002oZ-9z
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 03:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757403036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v4jjMFokisxlOpdRVyPs75YnY73qC2mqfFx4mTfIkTM=;
 b=cL4FSnp0z7nyhbax0Q2agzpVrvE/3ITP4iV4e5hCDoHdpMQbJ7QJYmmdUOeoNsrf6l7qQv
 PuePGMa4LZLBWJwGTxK+WnbG57s/3KtmgXuKHNsdpVuQpwsdschusBRBmgSNVOYQdPCVzu
 GTOoshvu5118EsoIqylYzOIV9VFrpco=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-hOFJw0x2Og6Y9JE5tMh59g-1; Tue, 09 Sep 2025 03:30:33 -0400
X-MC-Unique: hOFJw0x2Og6Y9JE5tMh59g-1
X-Mimecast-MFC-AGG-ID: hOFJw0x2Og6Y9JE5tMh59g_1757403032
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3e751508f3aso254168f8f.0
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 00:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757403032; x=1758007832;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v4jjMFokisxlOpdRVyPs75YnY73qC2mqfFx4mTfIkTM=;
 b=jnYku9PFOUKwiyEKxMOHaoT6Sor4cwS4e1Ge/6xvNdy6pXDQbJVF2G83Cy3VEuXZMh
 zEI37O17+xhfop/qZ6OYmVTT7sex4qgkPIsof99ExHCWygoLpH9C1IY/JUQCR6P3jDpC
 ASOHL5nm4SphpAN9rJnHVyQhEBECSPPNh+1W7IleioRpkk/OTwAIQ3MvS+knOy8w/yRq
 /nHWdNgBTE4In0YQbWOF/YmHjMBJvAOST5RZiN4VTq0PFtd+poz45lvcQxlrx7SjkxxO
 wJ2h8Diaxux3WPbXeq0o/xD+8lHTjLESPgByPQgoQPnfiYYuuCVLw3NSJaawqEhT8Uw8
 qSUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLNbmvBzDNYJtJN3V1KYdSqHKBMmZFfdoS5Vanv2I8wb8ReWatunRe5Bo3LaSqwP1tgQxqQReZTA==@nongnu.org
X-Gm-Message-State: AOJu0YxD9pgH9Xh48jNxPBLbBMJTncMWpg02whBjpp3YQqn0v+ZUQpqw
 J0VVEjpEso86AcyCzRrsSvg40AbkbZ6qXD4wU9PmybNaz6HBii7Fez5Bc4IZtRHfWWZ4rK+jd/J
 VhAcSGxLzr3HgzKx0lTHjYCtMOcMjmXzFxeHHq+fZOD+AWP5dYXjutQ==
X-Gm-Gg: ASbGncvMt4fBG69GCwFj5Kd1KKydeQThV/Crejlvw/znxEYHfXaX6n4eRCS1C4k75Ts
 +otYD8rLNPQ3fvYXTS30CBcdLaR6Dk7qux7ytjiEo4kqXTSE1osospy+c62BW0dOpQx1AaskqXm
 ImnfjxfoIGX7yo9ihx4dMx0Kr6kNdVDRodYJnWz1MzNSA2Z4jryONfr3LnQ99M3u0/+hMyCv3yU
 odM1xJ9RLbjjojtDKLwwB9QJGyynCNMkpFekjhXgxqQlq0bZ+VeuDxl/KR8PhypTYHvwqOWlnbe
 QQOcuUluxPo/0hXpcjT/nuVHDe8iYP/udHtB1pbDmkR7tx6o9yyrox1VzEieuTxYNzl1ltiumCB
 Jt+jyJA==
X-Received: by 2002:a05:6000:2f83:b0:3e3:c5a8:a1be with SMTP id
 ffacd0b85a97d-3e62bae289emr7376011f8f.0.1757403031934; 
 Tue, 09 Sep 2025 00:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkj8G3xwWvx6i70fLBbw4+YGSNc58fiBErrC9Hk704jxMhQ3qNtBGTXn1cbPGluOuIq9xQNw==
X-Received: by 2002:a05:6000:2f83:b0:3e3:c5a8:a1be with SMTP id
 ffacd0b85a97d-3e62bae289emr7375990f8f.0.1757403031484; 
 Tue, 09 Sep 2025 00:30:31 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-113-183.pools.arcor-ip.net.
 [47.64.113.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9c5c89f2sm287528025e9.14.2025.09.09.00.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 00:30:30 -0700 (PDT)
Message-ID: <0c17958b-cb28-4e5d-9dd3-cb849a288674@redhat.com>
Date: Tue, 9 Sep 2025 09:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] Revert "meson.build: Disable
 -fzero-call-used-regs on OpenBSD"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250508144120.163009-1-thuth@redhat.com>
 <20250508144120.163009-6-thuth@redhat.com> <aBz3Rh6S5emirSPz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <aBz3Rh6S5emirSPz@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4DicOwevS9I4sAvfcFN3bmCRKLDsrOYnhHBZ0iyYatk_1757403032
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 08/05/2025 20.26, Daniel P. Berrangé wrote:
> On Thu, May 08, 2025 at 04:41:20PM +0200, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> This reverts commit 2d6d995709482cc8b6a76dbb5334a28001a14a9a.
>>
>> OpenBSD 7.7 fixed the problem with the -fzero-call-used-regs on OpenBSD,
>> see https://github.com/openbsd/src/commit/03eca72d1e030b7a542cd6aec1 for
>> the fix there.
>>
>> Suggested-by: Brad Smith <brad@comstyle.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Note: Marked as RFC since we likely can include this only once OpenBSD
>>   7.6 goes out of service, see:
>>   https://lists.libreplanet.org/archive/html/qemu-arm/2025-05/msg00559.html
> 
> Yep, we have to wait a bit longer, unless someone can confirm the
> fix was backported to 7.6

Now that QEMU 10.1 has been released, I'm going to include this patch in my 
next pull request. OpenBSD 7.8 should get released in October, so 7.6 will 
go out of service at that point in time, and our next QEMU release is likely 
in December, so we should be fine. Or has anybody still concerns about 
including this now?

  Thomas


>>
>>   meson.build | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 6c61e1dcaec..5f0e6a65cb0 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -699,11 +699,7 @@ hardening_flags = [
>>   #
>>   # NB: Clang 17 is broken and SEGVs
>>   # https://github.com/llvm/llvm-project/issues/75168
>> -#
>> -# NB2: This clashes with the "retguard" extension of OpenBSD's Clang
>> -# https://gitlab.com/qemu-project/qemu/-/issues/2278
>> -if host_os != 'openbsd' and \
>> -   cc.compiles('extern struct { void (*cb)(void); } s; void f(void) { s.cb(); }',
>> +if cc.compiles('extern struct { void (*cb)(void); } s; void f(void) { s.cb(); }',
>>                  name: '-fzero-call-used-regs=used-gpr',
>>                  args: ['-O2', '-fzero-call-used-regs=used-gpr'])
>>       hardening_flags += '-fzero-call-used-regs=used-gpr'
>> -- 
>> 2.49.0
>>
> 
> With regards,
> Daniel


