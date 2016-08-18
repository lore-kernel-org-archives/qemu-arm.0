Received: by 10.25.21.156 with SMTP id 28csp335849lfv;
        Thu, 18 Aug 2016 07:05:50 -0700 (PDT)
X-Received: by 10.55.22.199 with SMTP id 68mr2433242qkw.259.1471529147792;
        Thu, 18 Aug 2016 07:05:47 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r81si1329332qka.103.2016.08.18.07.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 07:05:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baNx5-0001Bp-9c
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 10:05:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1baNw8-0000ox-8R
	for qemu-devel@nongnu.org; Thu, 18 Aug 2016 10:04:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1baNw1-00077G-JS
	for qemu-devel@nongnu.org; Thu, 18 Aug 2016 10:04:47 -0400
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242]:34871)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1baNw1-00077B-EH; Thu, 18 Aug 2016 10:04:41 -0400
Received: by mail-io0-x242.google.com with SMTP id q83so2940551iod.2;
	Thu, 18 Aug 2016 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=oEv6ij5cOGlnea9aCp5cDH/v4CR3g84S/AL4JxyszJU=;
	b=qgQFXB4kySHfgzCbJJnXYF84TK8WztGn6U9GBQqlUYeEpmw0YMF+4BjBHfXmIo3u43
	K9tLEEf1Ouab5nmFWY1s0P49Nt612zplhdw6oMiVlqJ0oK4YubGs0AHzVo7M3SNB/iYT
	vwFsq3bmkMlMI9ndrUbLX28esR5irwdkbMCzVjTG4zC/3jHhZUDGcw6Jjv3MerPA0TDh
	shQfMwAESsPVHczgpNyK/LtyUa6Rh6E3UDQwIa7MgrDC7PEPBmxJFrxbQqtB3w9oTuEb
	Q/NIzAuojzERnj99arHp8xyUeTlMwfSqETbt+jpsx3ZBtckOWeOdkUr6clMqE4Fne8Le
	74jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=oEv6ij5cOGlnea9aCp5cDH/v4CR3g84S/AL4JxyszJU=;
	b=XCpl5FzZqNnP+VHEdkloVrObFZ0ES1lFJuQqjpy01TSZxgKNrvwYCgYnwnWzbgNnRR
	MoqJJQA9rEXwnMUnABU+wyKOd5ieK9JpqV3x34m7PQr6+lT5xnv5IO6rW0CAHBktLiWA
	f2Qici1HXDoa4dCfPUhaD6HwoPaqm/iqaCaymjPhwZ29BuG+BSvtncAV+4TwufPImHbR
	gNYRceFijB2rnA+wJuToLFQRQE8elxZWyXF6prOEcAiXve72ifEwpNzkQTxAFdXqCSAz
	vuggPMqNlYdlwTzMDetmlhwFmX1UG6+0CaL1U+jR6LKxCUnNo3s8JVgzRB7PzjBLnKdA
	d93g==
X-Gm-Message-State: AEkoouslKFHgP6CUAdKW2YFw3/iaqjJMJ6+0vN2hBZubl6xkMRp/rV25dRqeCurpJAixMg==
X-Received: by 10.107.12.223 with SMTP id 92mr3183589iom.158.1471529080868;
	Thu, 18 Aug 2016 07:04:40 -0700 (PDT)
Received: from bigtime.twiddle.net ([208.95.30.164])
	by smtp.googlemail.com with ESMTPSA id
	m128sm1159915iom.32.2016.08.18.07.04.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 07:04:40 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
	<151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
	<CALicx6vzQyvhQPM2qgN1wkT_M+vr2WL+H5pc9HhuB=kWVU-JnQ@mail.gmail.com>
	<59517fd9-049c-adfc-5793-68165fe87f34@redhat.com>
	<CALicx6tGZ1z68nTBdYrSTcdBzCQwzHtGJ-DixKJjKSq7-cfkHw@mail.gmail.com>
	<f5f56ea7-795e-81d3-6892-f30772631e53@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <5e34688d-af70-9fed-33c7-96d86868d1a6@twiddle.net>
Date: Thu, 18 Aug 2016 07:04:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <f5f56ea7-795e-81d3-6892-f30772631e53@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::242
Subject: Re: [Qemu-devel] [RFC PATCH v2 1/2] utils: Add helper to read arm
 MIDR_EL1 register
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vah7DHeC7o0e

On 08/18/2016 02:39 AM, Paolo Bonzini wrote:
>
>
> On 18/08/2016 11:01, Vijay Kilari wrote:
>> On Thu, Aug 18, 2016 at 2:20 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>>
>>> On 18/08/2016 09:56, Vijay Kilari wrote:
>>>> The get_aarch_cpu_id() has check " if (unlikely(!cpu_info_read)) ".
>>>> If we call get_aarch_cpu_id() from is_thunderx_pass2_cpu() which is
>>>> called from inside the loop, we will be adding one additional check.
>>>
>>> On the other hand, you are making an assumption that the caller of
>>> is_thunderx_pass2_cpu() calls get_aarch64_cpu_id() first, and not
>>> documenting it anywhere.
>>>
>>> And given that you shouldn't call _any_ function from inside such a hot
>>> loop, your solution is inferior on both counts.
>>
>> Yes, but I could not think of better way to get rid of this check.
>
>     bool need_aa64_prefetch = is_thunderx_pass2();
>     for (...) {
>          if (need_aa64_prefetch) {
>              ...
>          }
>     }
>
> The check on cpu_info_read is done just once.

Supposing a check is required at all, this is still inferior to either

(1) If completely outside the loop,

   if (is_thunderx_pass2()) {
       for (...)
         ...
   } else {
       for (...)
   }

or (2) ifunc, so that we only check once, not every invocation.


r~
