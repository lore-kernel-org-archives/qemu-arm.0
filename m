Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp994908ejc;
        Fri, 26 Jan 2024 08:49:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsATw1dnBWb05WB8fD1kh4+rX+HMwI1RDRpyjaWSh0PqBB7iCZCc9qhEDyQuQAPiAJydjj
X-Received: by 2002:a05:6830:7311:b0:6dc:854a:3d91 with SMTP id ex17-20020a056830731100b006dc854a3d91mr1859251otb.30.1706287764967;
        Fri, 26 Jan 2024 08:49:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706287764; cv=none;
        d=google.com; s=arc-20160816;
        b=yuiqK1gIPWtnSo8B1DkHzAjrjHtOgRG5rhF7LAS85MFuPi4HXqbXYaErNgl8RSjDVb
         6Uwax/wr+f8ijvqxssYvJqSrKPeSVOWdmVqahwi7j4OVi/BnpUBtU/CuZq0+b8sm7Rj8
         ++M8vUnlIynE6q7FZc1JL6/3YOmDAMVXO4j5jWSeIcpjTFGfhuPxgHCH1yPcZRQP+ZV6
         GilgXSMHFc56v9EiLoFcKbGqmJqHJzIjmwtsTiyB2CAIgdoN5DsdYiZCto3cLISiR/+B
         kChFqWG5qDplIXR5frypm5BwiSsN8xkvKYgwKKDnDwLZL+PbqJ94pE4oZLNq6bzFr0mj
         SSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=AvJz8RZ1AxCB0wgZE0erN3aj30Zjp6k5rD16YiMIfmk=;
        fh=S6ku4RShRUFA+7Q61K+CSxboSpS3zBXnGkZDMgwjT6Y=;
        b=0bEH+BR82UnzmIPrb5YFOsISTWeodqbKt/aJkqbTnJtACeZHJY1WHVwA725jtAUESI
         CJqhLWqq+oxdTjyPTbwdxzwD34Nwu6ul9RgwKRZXF1/EE4s3kQ/pqeDb4zBlnDKnIY84
         rTQHOO0iwWlAFwk1gV44xnz1IIzpIWS8lw12engVPhK8ZCasDm7Qz3Tl6bO+pEzDLePn
         3yh7lrIWAoSY+FZ0USGi2SOkHpy0ezblH6ZsNNjp1SsSvAyc4cm4ISxEfG3oE8G9W3rB
         i5icrUxALHzN5kgjj8dKSC0PBvuGVHT5pZzFjTl3YzLnmuSuiW0oX8Vc3BrXxKMoOYA+
         CZag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a05622a118200b0042a85ee0914si676640qtk.19.2024.01.26.08.49.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 08:49:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTPO6-0004t8-Tx; Fri, 26 Jan 2024 11:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTPO5-0004su-Vt; Fri, 26 Jan 2024 11:49:05 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTPO3-0007bc-Rg; Fri, 26 Jan 2024 11:49:05 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TM3Yk1qTzz4xF2;
 Sat, 27 Jan 2024 03:48:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TM3Yh5kY6z4x23;
 Sat, 27 Jan 2024 03:48:56 +1100 (AEDT)
Message-ID: <1ab62ecc-7e3e-4c84-96e9-040193d9b35b@kaod.org>
Date: Fri, 26 Jan 2024 17:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/17] aspeed queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Ninad Palsule <ninad@linux.ibm.com>
References: <20240126133217.996306-1-clg@kaod.org>
 <CAFEAcA8Q66Qw7spMOcBju0v-=C=x10hz1rwPWxjCzYWhdkX8Ww@mail.gmail.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8Q66Qw7spMOcBju0v-=C=x10hz1rwPWxjCzYWhdkX8Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: u2tyZUYMcjiv

On 1/26/24 16:56, Peter Maydell wrote:
> On Fri, 26 Jan 2024 at 13:33, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The following changes since commit e029fe22caad9b75c7ab69bd4e84853c11fb71e0:
>>
>>    Merge tag 'pull-qapi-2024-01-26' of https://repo.or.cz/qemu/armbru into staging (2024-01-26 10:21:27 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/legoater/qemu/ tags/pull-aspeed-20240126
>>
>> for you to fetch changes up to b40769f4b49d15485ffaaa7acade3e3593ee6daa:
>>
>>    hw/fsi: Update MAINTAINER list (2024-01-26 14:22:08 +0100)
>>
>> ----------------------------------------------------------------
>> aspeed queue:
>>
>> * Update of buildroot images to 2023.11 (6.6.3 kernel)
>> * Check of the valid CPU type supported by aspeed machines
>> * Simplified models for the IBM's FSI bus and the Aspeed
>>    controller bridge
>>
>> ----------------------------------------------------------------
> 
> Looks like you have an endianness bug, either in the device
> or in the test. From the s390 runner:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/6029422595
> 
> 232/847 qemu:qtest+qtest-arm / qtest-arm/aspeed-fsi-test ERROR 0.38s
> killed by signal 6 SIGABRT
>>>> PYTHON=/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/pyvenv/bin/python3 QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon QTEST_QEMU_BINARY=./qemu-system-arm G_TEST_DBUS_DAEMON=/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/tests/dbus-vmstate-daemon.sh MALLOC_PERTURB_=82 QTEST_QEMU_IMG=./qemu-img /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/tests/qtest/aspeed-fsi-test --tap -k
> ――――――――――――――――――――――――――――――――――――― ✀ ―――――――――――――――――――――――――――――――――――――
> stderr:
> **
> ERROR:../tests/qtest/aspeed-fsi-test.c:152:test_fsi0_getcfam_addr0:
> assertion failed (curval == 0x152d02c0): (3221368085 == 355271360)
> (test program exited with status code -6)
> 
> where 3221368085 is 0xC0022D15, and 355271360 is 0x152D02C0...


drat. Indeed. I didn't check BE ... Sorry about that.

Ninad,

Some changes are required in fsi_aspeed_apb2opb_write().

Could you please rework the address space accesses to use
address_space_*_le() routines instead of address_space_rw() ?
This will be less concise.

To check, you can use a PPC64 debian (big-endian) on a PPC64
KVM guest or PowerVM LPAR, or a s390x LPAR.


Thanks,

C.

