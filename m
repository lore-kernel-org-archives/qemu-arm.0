Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B8FCA0FE7
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 15:02:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqvBV-0000Gu-Cq; Tue, 26 Aug 2025 11:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uqvBJ-0000EG-De
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 11:01:57 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uqvB8-0001qh-Hi
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 11:01:53 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-246d8e25f51so16346805ad.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756220490; x=1756825290; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ACjgcDLvoon9NUbIZIUiX3lyOafa5nmRxOYvYUER44U=;
 b=YNFPzd3s6+DjXeVV3OTMZ4dKSHylqmGRQqoFZSqS/gw9fkBZsulUmYUouJJ/G5qh3u
 L7IgHqnjDagJVaMMiI8JIH79iY3av/21HabWaSwJ7MPt1LWPn2KPyVQYw4D1M1fhQ46y
 vnEZ7EB1CLPxJZqSm7jZ24lOrjXbl/cPyISQQcWvgU90aGxBd0l4JuogW6GMvVGfuJzW
 RCvE4uxgXmSLNOMYS9qkK6lDL5/2WTAsI6Q3p8Q6psU8rT5pzcGDY6NfXyF7d52l0lqh
 Yp01wtWaWrMoCG7iXaX9xzd0euJr1j5weRtyeLbGoOcWvDSl9bvxvsUL4ZqAO/dK01IS
 7Vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756220490; x=1756825290;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ACjgcDLvoon9NUbIZIUiX3lyOafa5nmRxOYvYUER44U=;
 b=s7GXyY54GJ/mc2KOTTS2FrrDdug8lWa82EeVoESSRhldt1a3j+QNtQCcvj5bBYOhTk
 JyqoNxqzekKcloLfKCL7+wFwSLWwGhXP0dX1J+zlrfH5mFEJmxG7eZGDpu6YulCLzyCf
 aNw/QVvOoAeYpFWFCk5y9tWMxj5MXrxwL4vdeXBs2tv0V7IHSst4vk1wSPT17q6hxehf
 6IYY2IRZ8AjEBFOf2KEBF1xp/r0Vdkxvrun79mC6FraxVB6EO9dVlxd7yKfJl1aDf3fw
 FLa825h/te3HtdQQMwq68P0RvonoCc4l7KRW/nmKJtSPwqFdVdDqO4vorIFopqJcvrxY
 /aXg==
X-Gm-Message-State: AOJu0YyqrIRBKNABslWHGFrEf+EI2WN2A+H5BKmekDi499/4Pm4QOYiC
 DGmOIaAXUV4tnd9BSNxeyvF8zHyxxCpQX0NkiDhc0lfAwFuhezxFRX+ItxShm2z2kfXVbDZa3B6
 ZqneUKgc=
X-Gm-Gg: ASbGncuoNu56Nv5qbl2guQtWS6Tojdc4mwtublggiBKRmGBut9eGXifHOBhlEZSyn4+
 LjYzXpeqylk2HSxkypubWXyLwGL2bzpzUTPQS1SqswxExIGBmD/SNe1KYRac9EdpWriSwmLr+V6
 c8KIS7Sjhp0b2BdMjReA7QKS7Uf/W8ZDKI0y4tW/ngccvhw/xpqbzlUv3n4sOjvL/P/M6Rn+aMN
 Y1e5qxsaCkLz1flxGlVItrYI0cLz4RcIaW4jM7UbvR+0T/S7VTO8vtcGgjASwvZicfffFDn6TdG
 lMsLNOVs1GI92a9JUMIE/vP+pRWi72hh2h6h2pOEcWy9RPjKY3d8TsfkdvkVF25Q26xLkieMru9
 0UCht31dTFgBaWuH9ISHfsWErsO+WNO+noQ==
X-Google-Smtp-Source: AGHT+IFzkcNmizfxVp90cJeGRZGtt8sjPgJbBdjTdgJgjIyg8JZ4xp+YWZR1k22vtP5uCgX3xVSpaw==
X-Received: by 2002:a17:902:dad1:b0:242:9bc6:63c3 with SMTP id
 d9443c01a7336-2462efaa3b8mr223283535ad.54.1756220489616; 
 Tue, 26 Aug 2025 08:01:29 -0700 (PDT)
Received: from [192.168.0.102] ([187.75.38.174])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687b4f93sm98119355ad.58.2025.08.26.08.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 08:01:29 -0700 (PDT)
Message-ID: <9e08e638-9ab7-44cd-98cb-bd1a5b826f91@linaro.org>
Date: Tue, 26 Aug 2025 12:02:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] tests/functional: Adapt reverse_debugging to run w/o
 Avocado
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-arm@nongnu.org, 1844144@gmail.com, Jan Richter <jarichte@redhat.com>
References: <20250819143916.4138035-1-gustavo.romero@linaro.org>
 <53b6e23f-5328-42c6-9c58-97ddbf3e5b29@redhat.com>
 <a1105fed-dbd8-4223-b771-180ab12e3f77@linaro.org>
 <57b7b6c1-1820-4475-b84a-05b37cfbefdf@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <57b7b6c1-1820-4475-b84a-05b37cfbefdf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Thomas,

On 8/26/25 05:06, Thomas Huth wrote:
> On 25/08/2025 16.04, Gustavo Romero wrote:
> ...
>>> Anyway, shifting to a different test harness here makes me wonder whether the whole reverse_debug test should maybe be rather moved to tests/tcg instead, where we already have the basic support for the stuff from tests/ guest-debug/ ?
>>> The aarch64 would require a different guest payload, of course, in that case, so not sure whether it's feasible?
>>
>> I think reverse_debugging is really a functional test. It requires GDB, yes,
>> but also QMP and booting a whole kernel and the feature itself makes me think
>> it's a functional test. I wouldn't move it to tcg-check just for the sake of
>> no adding a new way to run test in meson.build in functional tests.
> 
> Ok, fair point. But thinking about this twice, wouldn't it be nicer to keep the current test harness and simply launch the script from the test_* methods instead?

If no additional module is used, then GDB needs to execute the test_* scripts via '-x' option
because only this way the script can do "import gdb", hence we need a runner that will call gdb
and pass the script to it.

Naturally, we can instead use a module like pygdbmi (as Manos suggested) or aautils (with the
caveats I mentioned about having to deal with GDB packets directly) that will simply wrap up
calling gdb and passing it the script with subprocess etc., so no need to augment the test harness.

The trade off I can see is: re-use the runner we use in check-tcg and augment the test
harness to accommodate it in the functional tests _vs_ use the "runner" from another module,
bring another python dependency and deal with another GDB API (I like using GDB native Python
API because it's simple, sufficient and self-contained, but I'm open to experiment with pygdbmi),
use another runner (other than the one in tests/guest-debug/test_gdbstub.py) and don't modify the
test harness.


> You could redirect stdout of the script into a log file, so that it cannot mess with the TAP output of the test. Or is there something that I missed and this cannot work?

Yeah, I really tried it but redirecting to a file using GDB Python
API didn't work :-(

I've tried to redirect GDB's output from the test script using
"set logging redirect on" but something is off. I even tried on GDB
master, but besides direct not taking effect (output is still printed
to the stdout) I got a GDB internal error when switching it off.

So, yes, it would work (even adding a # in the output messages so the
TAP protocol would simply ignore the lines at the same time we would
be able to see the output from GDB), but I was not able to make it work
with GDB native Python API, so turned to use the "exitcode".


Cheers,
Gustavo

