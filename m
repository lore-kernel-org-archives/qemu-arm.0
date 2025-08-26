Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA55CA0EFA
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 07:52:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqoT6-0008A1-Pp; Tue, 26 Aug 2025 03:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uqoT5-000894-Dp
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 03:51:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uqoSx-0000YX-C1
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 03:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756194694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ddVhjfvAaqbXkAZ2Yhv15epjMm/yhqfu1NEr5OLcrOQ=;
 b=LRj45SYo8S1HvB49Pv7p1GbCf81Md7cvjglZRJD868JILONvUexL8tuIUGCib0D92fo24q
 +7HXXzTRL9u3aRlT950lBKgrAUZf0b8TC7Z4HOiuxB4C7eJd0ch3lLE18QrVrwDLwB4PF4
 MLBMlFDnBJ1sfqlIAtgtwaxx7+Ywyys=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-Zv_pgxo7MIiO8nSMI8hPiQ-1; Tue, 26 Aug 2025 03:51:32 -0400
X-MC-Unique: Zv_pgxo7MIiO8nSMI8hPiQ-1
X-Mimecast-MFC-AGG-ID: Zv_pgxo7MIiO8nSMI8hPiQ_1756194692
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70d9a65c327so40668616d6.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 00:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756194692; x=1756799492;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ddVhjfvAaqbXkAZ2Yhv15epjMm/yhqfu1NEr5OLcrOQ=;
 b=jOhNh8geFFyOQUac/hTuCbCEKAyRQ3KVHNcX7JhkjhvaA9kCwaNU9HlGpQu1W4l5ng
 Mmd+WLG5C44q8ZUBDUtqPCyBEVtHAv/7abpo8clqUHaaxY1J6z/V5Gapv9czciiQ85WO
 3au5qGQlW/9P3Z95fnhWk+N16DRq4uTUyEak20pd7GDslCI2PwDJy3pjSch4vRN9FFuE
 quWln82XMxiOw1sLg/8z4o7smr/ow1UwKHNUucCYR85YtVvtL8PkF7ySpBbdIftvW23n
 iiRo68PS/swbWSukiBvh+RsuleKOcu6mGW0bS8Yx/HB3HkA8NfH4lJL0KuRtOQxirYtL
 9kmg==
X-Gm-Message-State: AOJu0Yxzz2ruNWpwrN7go/OIAAo1HLObMktOR7/No9JB59wf+BGmTfv/
 N9IQ3TcG5GJOkvKVJA3X7vaUZU22qinOXvVDzAfzh4bCLupmGsBE/u7JfTBGMjtEY+pGdHbfDPX
 kXxpca2fJGeCtYWXmZ3ychSFCl+pQ13Aj3fZXvW37BcKBUYnNK5L5CA==
X-Gm-Gg: ASbGncsT0Z14coQLENPMFp02AqGt1sI5q92F9rGPw4qk1aYoGBcLsX/EQrQr9wZnjE6
 XRFZTAaFO+v/Eo1WOY6AaZf4OZd20KfvGUywAkD1DlEZJURq6hZpy3VZSX8/IbFr/u64fZvnmOu
 VuPk3nx+JbrArY+V8zHpQqC3b7ANUeoIan7L9ZafIyXyt30CJ/7aNF+2AVBhc82PAlXRkyiNOc+
 DN4QIYlHT1w9j2istJPvxYR4DHhAMicWfIGY3P0ZetM/HKzxrR8q0u/AQp31uXXHUJMPs9p6APB
 +AQS1aCTpLh75646Vx/ICnqmfeSBiJ/jZnJmaE9XKJ8Mr2SfosOy8rN2RuJlwKsbISyXI369whc
 1xQ+J
X-Received: by 2002:a05:6214:5191:b0:70b:ca6d:24fc with SMTP id
 6a1803df08f44-70d972c5165mr157842826d6.24.1756194691938; 
 Tue, 26 Aug 2025 00:51:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGWiqTNOFLPieVmJVQF1lnIi949R3r/BOM9oKNVlo+tXOc/QYcFiicAnKiqAodFiKJy12Fsg==
X-Received: by 2002:a05:6214:5191:b0:70b:ca6d:24fc with SMTP id
 6a1803df08f44-70d972c5165mr157842736d6.24.1756194691545; 
 Tue, 26 Aug 2025 00:51:31 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-113-247.pools.arcor-ip.net.
 [47.64.113.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70da72da3fdsm60054876d6.73.2025.08.26.00.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 00:51:31 -0700 (PDT)
Message-ID: <8326014d-114e-47df-89fc-632eb5683632@redhat.com>
Date: Tue, 26 Aug 2025 09:51:27 +0200
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
X-Mimecast-MFC-PROC-ID: ECcVet9wJdGI83YRnaIA12a6nFPm0_NKnBrx85_K2Tg_1756194692
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
> Hello, Thomas!
> 
> On 8/25/25 07:29, Thomas Huth wrote:
>> On 19/08/2025 16.39, Gustavo Romero wrote:
>>> The goal of this series is to remove Avocado as a dependency for running
>>> the reverse_debugging functional test.
>>>
>>> This test, the last one I’m aware of that relies on Avocado, requires it
>>> because of the need for GDB to test reverse stepping and continue.
...
>> I gave it a try, but this did not work for me, the test was not run at all 
>> anymore. Are there any patches needed on top?
> 
> hmm that's odd. I'm able to run it with 'make check-functional' and with 
> 'meson test'...
> 
> This is how I'm running it (let me know if I'm missing something):
...
> gromero@gromero0:/mnt/git/qemu_$
> gromero@gromero0:/mnt/git/qemu_/build$ ../configure --target-list=aarch64- 
> softmmu --disable-docs
> gromero@gromero0:/mnt/git/qemu_/build$ make -j 32
> gromero@gromero0:/mnt/git/qemu_/build$ time make -j 15  check-functional
> [1/2] Generating tests/functional/func-precache-aarch64- 
> aarch64_reverse_debug with a custom command (wrapped by meson to set env)
> 2025-08-25 12:50:04,215 - qemu-test - INFO - Attempting to cache '/home/ 
> gromero/.cache/qemu/ 
> download/7e1430b81c26bdd0da025eeb8fbd77b5dc961da4364af26e771bd39f379cbbf7'
> 2025-08-25 12:50:04,225 - qemu-test - DEBUG - Using cached asset /home/ 
> gromero/.cache/qemu/ 
> download/7e1430b81c26bdd0da025eeb8fbd77b5dc961da4364af26e771bd39f379cbbf7 
> for https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/29/ 
> Everything/aarch64/os/images/pxeboot/vmlinuz
> GDB CMD: /usr/bin/gdb-multiarch -q -n -batch -ex 'set pagination off' -ex 
> 'set confirm off' -ex "py sys.argv=['/mnt/git/qemu_/tests/functional/ 
> test_aarch64_reverse_debug.py']" -x /mnt/git/qemu_/tests/functional/ 
> test_aarch64_reverse_debug.py
> [0/1] Running external command precache-functional (wrapped by meson to set 
> env)
> make[1]: Entering directory '/mnt/git/qemu_/build'
> [1/6] Generating qemu-version.h with a custom command (wrapped by meson to 
> capture output)
> /mnt/git/qemu_/build/pyvenv/bin/meson test  --no-rebuild -t 1 --setup 
> thorough  --num-processes 10 --print-errorlogs  --suite func  --suite func- 
> quick  --suite func-thorough
>   1/27 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64- 
> aarch64_virt_gpu                   SKIP              1.95s   0 subtests passed

I tried a couple of times now, and finally realized that it's the 
"gdb-multiarch" binary that is missing on Fedora. And as far as I can see, 
there is also no package that provides this on Fedora? So if we go ahead 
with your patches, this test will only run on certain distros that provide 
this binary.

  Thomas


