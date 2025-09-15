Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373AFCAC597
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Sep 2025 12:50:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uy8eo-0007XJ-Lk; Mon, 15 Sep 2025 08:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uy8eR-0007Bv-Im
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 08:49:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uy8eD-0002qR-4r
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 08:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757940570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BUUKoAo41CJwreQ9ZCD61KMP24ARohN8mBV2SYIsYz8=;
 b=fMtXmqiUbi7fW509A1hjpC4MPxfu/Zk/xy8mpauEk3MCX8SE99woxKXK8XSeYRBHsD0cnH
 KKxfzScn0a3yHzg5J3ti3yibdtUPdbPj1PkQakncc667r/MBUiDjVEv+DowFh78UvqIR7w
 c3bGb/7t8h1oKaC5l9gOcpeE2wGIftc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-oZBnUAm2PfKX0R7usp22bA-1; Mon, 15 Sep 2025 08:49:29 -0400
X-MC-Unique: oZBnUAm2PfKX0R7usp22bA-1
X-Mimecast-MFC-AGG-ID: oZBnUAm2PfKX0R7usp22bA_1757940567
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45dd66e1971so35475915e9.2
 for <qemu-arm@nongnu.org>; Mon, 15 Sep 2025 05:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757940567; x=1758545367;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BUUKoAo41CJwreQ9ZCD61KMP24ARohN8mBV2SYIsYz8=;
 b=RGUAxuHshUJDh+vPwOmQhW9xdPn9Y38dfrW8nteXG6NgB+Glm/v3PYwRDXRyr8fS9P
 cGLfp06/j854a1nmgYV7Xg0JCbWs7onBhifSIAKvtao03fcCgCtXcDGW2XXiWQMYoceA
 1uhYkrwlh3RWFu9LATDLdVJ1oP3acD56qkZG+Itr17u2oWHz88BtUfGk8pWPJsFivD99
 sSEzaoajKmWcjq3rOiT0M3bdoF1GAxG1i+s4ZHeWOpfGrgZw8Htts+VFqZQJvNmknAPU
 wdgb6QGLlPKJ7Rn9vtMQjLdy2RbEPmIZWmP+OI4C4VR7eOpjr9cASOz6huSwvhTd9kNJ
 37Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU30gQUvficFaoTHabgmqkeLIhIoKxQWJgoSZWbciMoTk876Q8zVOvBL7zQoBl1fG0wWSEm271v5g==@nongnu.org
X-Gm-Message-State: AOJu0YztbguD4WBP8ecBOMRGJ7hdAzIlPHT8Q9GdMLlqCbFLmimxHQco
 fDnc4f1bDHdSMNHeC8uyyoT4HHg1g3O39JAL40eSDrAlY3uMUIQw8E2b6K0LMxDSSIxlqImGujq
 +PIy1J3h00Y635jU5Jl0Iffiiy4V1A5Zxs/gBBbyY2IVizjNG3JP8Yg==
X-Gm-Gg: ASbGncty7OZZwyc8xD1aofRR8x2xPGlIYUKYh8wmVRDWL46Zoo9Imra44q+o2HQLskS
 1vYcCCZIAl4E7/7JHZJJFCto0J9RHD1CADJfWufsL5LHDSQW9q+cU51p70K3a0ovR3atKXKRLN/
 k05mBES1RVufI0cuGQIuHRQvztrMcI1bjINqdZEKGdFfPMEgDkHhsKdp/0szYdub3rCHpe0ruHC
 eHX/VfVI4PjgDsCUqre1nOYaHp7bBX0F1w5PJQy0cCqpsk39+FCCWVpNVyqs8Cg5VgDEL20316G
 XelDCCol9kiNn5kivPBAcqWr01s6sJH9jkAVybSni1eruKcHDt2bUVxRdBP8KfP8/yEX8ziiNgI
 N4JtyWA==
X-Received: by 2002:a05:600c:4fd6:b0:45b:76c6:cfb8 with SMTP id
 5b1f17b1804b1-45f211d5d7bmr105599945e9.9.1757940567230; 
 Mon, 15 Sep 2025 05:49:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9jZtjvbleadooUxhVdf5bWxz4eh2s5Zn5cTlQZ9Qif/+ThvjzpuyPM8TWvE3InE1yuYbDjA==
X-Received: by 2002:a05:600c:4fd6:b0:45b:76c6:cfb8 with SMTP id
 5b1f17b1804b1-45f211d5d7bmr105599615e9.9.1757940566738; 
 Mon, 15 Sep 2025 05:49:26 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-113-183.pools.arcor-ip.net.
 [47.64.113.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e017b2722sm96511295e9.1.2025.09.15.05.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 05:49:26 -0700 (PDT)
Message-ID: <07635935-fc6c-48bf-81b6-bc3709197411@redhat.com>
Date: Mon, 15 Sep 2025 14:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] tests/functional: Adapt reverse_debugging to run
 w/o Avocado
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250904154640.52687-1-gustavo.romero@linaro.org>
 <aL7CsSppNc-WZFY-@redhat.com>
 <a6320118-84f0-4088-82de-7192be6093cd@linaro.org>
 <aMQzD0m3QluWzlmh@redhat.com> <871pob64iv.fsf@draig.linaro.org>
 <aMRJ6nfXF2l7iu7b@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <aMRJ6nfXF2l7iu7b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L3LkDz10x_rIxHtTtPPIC3gJzlxXC0ZeatfkYrzq0y4_1757940567
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.035,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 12/09/2025 18.27, Daniel P. Berrangé wrote:
> On Fri, Sep 12, 2025 at 05:04:40PM +0100, Alex Bennée wrote:
>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>
>>> On Thu, Sep 11, 2025 at 08:51:08PM -0300, Gustavo Romero wrote:
>>>> Hi Daniel,
>>>>
>>>> Thanks a lot for review and the suggestions.
>>>>
>>>> On 9/8/25 08:49, Daniel P. Berrangé wrote:
>>>>> On Thu, Sep 04, 2025 at 03:46:35PM +0000, Gustavo Romero wrote:
>>>>>> In this series, we leveraged the run-test.py script used in the
>>>>>> check-tcg tests, making it a GDB runner capable of calling a test script
>>>>>> without spawning any VMs. In this configuration, the test scripts can
>>>>>> manage the VM and also import gdb, making the GDB Python API inside the
>>>>>> functional test scripts.
>>>>>>
>>>>>> A --quiet option has been added to run-test.py so it doesn't print the
>>>>>> command line used to execute GDB to the stdout. This ensures that users
>>>>>> don't get confused about how to re-run the tests. One can re-run the
>>>>>> test simply by copying and pasting the command line shown by Meson when
>>>>>> V=1 is passed:
>>>>>>
>>>>>> $ make -j check-functional V=1
>>>>>>
>>>>>> or, alternatively, once the test run completes, the exact command found
>>>>>> in the 'command:' field of the build/meson-logs/testlog-thorough.txt
>>>>>> file generated by Meson. Both methods provide the correct environment
>>>>>> variables required to run the test, such as the proper $PYTHONPATH.
>>>>>
>>>>> While I like the conceptual idea of just sending human GDB commands,
>>>>> instead of working with GDB protocol packets, I really dislike the
>>>>> effect this has on the execution / startup of the functional tests
>>>>> via use of the custom runner for a number of reasons
>>>>>
>>>>>    * The command line for launching the test outside of meson is very
>>>>>      complicated, so not memorable
>>>>
>>>> Why very complicated? It calls a simple runner instead of calling the
>>>> test script directly, but it doesn't change the way to re-run a single
>>>> test. One just have to pass V=1 to see make's command line  and copy
>>>> and paste the full command line to re-run the test. I mentioned
>>>> inspecting 'testlog-thorough.txt' just for completeness.
>>>
>>> Today we can run the individual tests directly
>>>
>>>   # ./tests/functional/x86_64/test_reverse_debug.py
>>>   TAP version 13
>>>   ok 1 test_reverse_debug.ReverseDebugging_X86_64.test_x86_64_pc
>>>   1..1
>>>
>>>
>>> (assuming you have PYTHONPATH and QEMU_TEST_QEMU_BINARY env set)
>>
>> and the old version of Avocado...
>>
>>> This gives you a very easy way to interact with the test, see
>>> its progress, understand what failed, and debug it with strace,
>>> etc.
>>>
>>> This change looses all that. It appears I can run it with
>>>
>>>    # ./tests/guest-debug/run-test.py --quiet --gdb gdb --test \
>>>         ./tests/functional/x86_64/test_reverse_debug.py
>>>
>> <snip>
>>>
>>>
>>> This undermines the core goals of what we aimed to achieve with
>>> the new functional test harness.
>>>
>>>>
>>>>>    * It makes the meson.build rules much more complicated
>>>>
>>>> Do we want to never augment functional tests' meson.build? Nothing
>>>> complicated is being added. Basically, just a new variable suffixed with
>>>> '_with_runner' which holds a tuple (test, runner) that tell the test
>>>> to be executed, following the same logic we already have for all the other
>>>> variables that specify the tests per arch/mode/speed.
>>>>
>>>> Another option would be to select a runner based on a suffix in the test
>>>> name, for instance, 'reverse_debug_with_runner.py'.
>>>
>>> IMHO the overall concept of using the run-test.py runner for launching
>>> the tests is flawed and not viable. It adds too much complexity to the
>>> use of the tests, and harms the output.
>>
>>
>>
>>>
>>>>>    * Running standalone there is no TAP output available making the
>>>>>      test hard to debug on failure or timeout
>>>>
>>>> This is because of an unfortunate GDB Python API issue, please see my
>>>> reply in your comment on patch 5/5. This can be solved but needs more
>>>> investigation on GDB side.
>>>>
>>>>
>>>>> I understand the need to spawn the test via gdb, in order to be able
>>>>> to import the 'gdb' python module. Looking at what reverse_debugging.py
>>>>> does, however, makes me question whether we actually need to directly
>>>>> use the 'gdb' python module.
>>>>>
>>>>> The only APIs we use are 'gdb.execute' and 'gdb.parse_and_eval'.
>>>>>
>>>>> The latter is only used once as
>>>>>
>>>>>     gdb.parse_and_eval("$pc")
>>>>>
>>>>> and I believe that can be changed to
>>>>>
>>>>>     gdb.execute("printf \"0x%x\", $pc", to_string=True)
>>>>>
>>>>> IOW, all we need is 'gdb.execute("....", to_string=True)'
>>>>
>>>> Yes, I do want to directly use the 'gdb' python module directly in the
>>>> tests. We shouldn't look at a solution only for reverse_debug.py but also
>>>> think of any future tests that will require the GDB Python API, so I don't
>>>> want to specialize here and reduce the API to a single method.
>>>
>>> If any other tests needing GDB arrive int he future we can consider
>>> them at that time.
>>
>> We already have a whole chunk of gdb tests under check-tcg. Maybe it
>> would be easier just to re-write the tests to use the check-tcg system
>> tests rather than jumping through hoops to fit in with the
>> check-functional requirements.
> 
> Well if 'easy' is our goal, then we can just copy the gdbmi.py
> file from avocado into our test suite.

But maintaining that stuff in the QEMU repository is also kind of ugly.

I took another stab at the problem:

  https://lore.kernel.org/qemu-devel/20250915124207.42053-1-thuth@redhat.com/

It's basically Gustavo's patches, but I removed all the stuff around 
tests/guest-debug/run-test.py and the cumbersome code for running a test 
through gdb via meson.build.

The test start in normal pycotap mode, then call a new function called 
reverse_debug() which then takes care of calling gdb with the right 
arguments (i.e. this logic has been copied from the run-test.py script).

It seems to work fine with the aarch64 test already, but details and other 
architectures still need some more love.

WDYT? Is it worth to pursue that approach?

  Thomas


