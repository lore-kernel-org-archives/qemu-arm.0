Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4759702ejc;
        Wed, 18 Oct 2023 09:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2BWVjOLbt7+ByEanU8dRTxwi4n/wQKBGyWASgrAb5ecqMRcIJmsB3puMrULRRtoEw24mj
X-Received: by 2002:a05:6214:cc8:b0:66d:4680:6dc5 with SMTP id 8-20020a0562140cc800b0066d46806dc5mr8781560qvx.50.1697646286260;
        Wed, 18 Oct 2023 09:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697646286; cv=none;
        d=google.com; s=arc-20160816;
        b=oFdIuBM8gZpSChrY03RSkdlTSAdNgKzmjTVL8KiiG43lX5kuxWViBSZ6bMkGF7KAgH
         ub1kqw2clEbbnzd4ZvCAbt8RZ3MV8e+Y70K/HeHADFVv3G3MbgyF6jcfj2vSFS0UhlQj
         E99Oe0WQezDUqohnjbMp3erXiUzCKv/3e4d2PEnMVk19qoizD84HqN1uJrzdt6CxxWTb
         +W3x+v3ugwIzGW1QaRh+yzZs9OwbS/GIcCQJDavwrwJN5dGZn1nF5Qe52l+aGmue4ZLx
         2A4p+PTqnl1lK0T1gDYsLqLYxWTwRVRdSG/HMreePoHfhwlwqm/E6apyO7jCrY13++tt
         pjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=DxaQpWyohR1989GHWUZ08ZEv6gnHvALDQAL8GToFJnI=;
        fh=5KD7BjLGFDublHDNRImOelVUthgQZWbxdG3c9Bb6fGg=;
        b=rwN/FfKcXjcnNNu9ug54/jdywmcCK8t7+WT0MMm+VabKjp6xElLromLYFB2FQLHi+K
         mRR2IAYh8jUTDqAlUQ1eew6BAfysJkAHUG5538ka2T5y09SBFkKnf82MgDdJKbxzK3UR
         3AhxSBB6MO+UOPtYGGUrx+xV9VWTLkUtgCTRa5sYtwmS15thEWnp6DTfrm7O4LTkObfP
         zHdZdRvoKwz8G1Wz837xj3DSx5JcGpYqc4cLV/UNXuXmPz6ixKJnWIrmu3TtyCXDpO2S
         nDaNOXJXP+lCN1BBdb8KfssCtNGcS9mBrrHJSepuly3kDiNZJFUcG+vVpL2vUfFuyGyi
         0kFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iSoBwodq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18-20020a0cd6d2000000b0066cfe943369si156320qvi.358.2023.10.18.09.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 09:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iSoBwodq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt9Lf-0002MZ-7V; Wed, 18 Oct 2023 12:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt9Ld-0002MA-HE
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 12:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt9Lb-0005JV-Ol
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 12:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697646278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DxaQpWyohR1989GHWUZ08ZEv6gnHvALDQAL8GToFJnI=;
 b=iSoBwodq0SVGnwMDZ1+OSpH/wbwNpYHdvkSS2w/xUNdRO80M+vUVwf79NdPaCAv+kLCM7X
 Qd2+LPeE9bZAoZXH3wsv2dZJeY0cEjK0l+3hrV/ngrE50EI0mTMypMJanPwjhFSBuohqiV
 JXXlr7dphVlT+8KzwLZlcFgY4b+3YZ8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-oaf5qr8QOgKS8ksgkgU8xw-1; Wed, 18 Oct 2023 12:24:22 -0400
X-MC-Unique: oaf5qr8QOgKS8ksgkgU8xw-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-66d120c28afso78821456d6.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 09:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697646262; x=1698251062;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DxaQpWyohR1989GHWUZ08ZEv6gnHvALDQAL8GToFJnI=;
 b=eJBqykB94udJFTUr+eCP5l1HpdA/TU0dgRwXEpZKei38S+OcahSt7SPTN8nd86T9yX
 04kZuspz5AzoK8ENG3NuP7nRafEIuBiIQ/lSnQzXCWcvnqmMpL3MDcHIU6rWQWbiZeJV
 Ts3GbajHAggUwG19Ly4GySkyVrJ/xzLcxNCwG1sAIfwWaeHhMvmHjCUu3vcGW5xfwsIC
 qQ1Bmh5qVlo7/hVYM1WR26M22L9UMx8KFmgUDh7pQUwwR+rJKhj2Oyor28zzXMt/CWd3
 Tf0wZ2Op9qMC0236mYIdLo1wQ77uNC7H1TwdLzT4X6aDkuEyB/P7C//gtdLZ/z6lnNCG
 LxlQ==
X-Gm-Message-State: AOJu0YzcAFraizAqyFzpYQtzSlYOx6nvjComyG8khPbSHb3jZ3svcnRV
 nJBq5iQICZ9p1ElzJfSI1ygqMNZOS1694Hpehl7QMgeT78qFJ/aXoh9CGZT6xq/9pUAYH+nKg6f
 U6z3XDGaIpa8E
X-Received: by 2002:a05:6214:19e7:b0:66d:5d84:f833 with SMTP id
 q7-20020a05621419e700b0066d5d84f833mr7772492qvc.37.1697646262016; 
 Wed, 18 Oct 2023 09:24:22 -0700 (PDT)
X-Received: by 2002:a05:6214:19e7:b0:66d:5d84:f833 with SMTP id
 q7-20020a05621419e700b0066d5d84f833mr7772455qvc.37.1697646261738; 
 Wed, 18 Oct 2023 09:24:21 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 p18-20020a0cfad2000000b006564afc5908sm66189qvo.111.2023.10.18.09.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 09:24:21 -0700 (PDT)
Message-ID: <393f1aa0-afb5-4269-8499-80afd5b98e48@redhat.com>
Date: Wed, 18 Oct 2023 18:24:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] hw: Strengthen SysBus & QBus API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231018141151.87466-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231018141151.87466-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: bkUmytPFdFvd

On 18/10/2023 16.11, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series ensure:
> 
> - qbus_new() and sysbus_init_mmio() are called *before*
>    a device is realized,
> - sysbus_mmio_map() is called *after* it is realized.
> 
> First we fix some abuse, then we enforce in qdev/sysbus
> core code.

I like the idea, and just had a try with "make check-qtest" with the patches 
here, but seems like there are more spots that need attention:

  10/433 qemu:qtest+qtest-ppc64 / qtest-ppc64/qom-test 
              ERROR           0.72s   killed by signal 6 SIGABRT
 >>> MALLOC_PERTURB_=217 QTEST_QEMU_IMG=./qemu-img 
G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh 
PYTHON=/home/thuth/tmp/qemu-build/pyvenv/bin/python3 
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
QTEST_QEMU_BINARY=./qemu-system-ppc64 
/home/thuth/tmp/qemu-build/tests/qtest/qom-test --tap -k
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀ 
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
qemu-system-ppc64: sysbus_mmio_map(type:power9_v2.2-pnv-chip, index:0, 
addr:0x603fc00000000, prio:0) but object is not realized
Broken pipe
../../devel/qemu/tests/qtest/libqtest.c:203: kill_qemu() detected QEMU death 
from signal 6 (Aborted) (core dumped)

(test program exited with status code -6)

TAP parsing error: Too few tests run (expected 17, got 0)
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

...

  24/433 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test 
              ERROR           5.94s   killed by signal 6 SIGABRT
 >>> QTEST_QEMU_BINARY=./qemu-system-aarch64 
G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh 
QTEST_QEMU_IMG=./qemu-img 
PYTHON=/home/thuth/tmp/qemu-build/pyvenv/bin/python3 
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
MALLOC_PERTURB_=105 /home/thuth/tmp/qemu-build/tests/qtest/qom-test --tap -k
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀ 
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
qemu-system-aarch64: sysbus_init_mmio(type:pxa2xx_pic) but object is realized
Broken pipe
../../devel/qemu/tests/qtest/libqtest.c:203: kill_qemu() detected QEMU death 
from signal 6 (Aborted) (core dumped)

(test program exited with status code -6)

TAP parsing error: Too few tests run (expected 95, got 3)
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

...

  73/433 qemu:qtest+qtest-ppc64 / qtest-ppc64/boot-serial-test 
              ERROR           2.65s   killed by signal 6 SIGABRT
 >>> QTEST_QEMU_IMG=./qemu-img 
G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh 
PYTHON=/home/thuth/tmp/qemu-build/pyvenv/bin/python3 
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
MALLOC_PERTURB_=129 QTEST_QEMU_BINARY=./qemu-system-ppc64 
/home/thuth/tmp/qemu-build/tests/qtest/boot-serial-test --tap -k
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀ 
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
qemu-system-ppc64: sysbus_mmio_map(type:spapr-xive, index:0, 
addr:0x6010000000000, prio:0) but object is not realized
Broken pipe
../../devel/qemu/tests/qtest/libqtest.c:203: kill_qemu() detected QEMU death 
from signal 6 (Aborted) (core dumped)

(test program exited with status code -6)

TAP parsing error: Too few tests run (expected 7, got 3)
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

...

270/433 qemu:qtest+qtest-ppc64 / qtest-ppc64/cpu-plug-test 
             ERROR           0.40s   killed by signal 6 SIGABRT
 >>> QTEST_QEMU_IMG=./qemu-img 
G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh 
PYTHON=/home/thuth/tmp/qemu-build/pyvenv/bin/python3 
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
MALLOC_PERTURB_=175 QTEST_QEMU_BINARY=./qemu-system-ppc64 
/home/thuth/tmp/qemu-build/tests/qtest/cpu-plug-test --tap -k
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀ 
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
qemu-system-ppc64: qbus_new(type:spapr-vio-bus parent:spapr-vio-bridge, 
name:spapr-vio) but parent realized
Broken pipe
../../devel/qemu/tests/qtest/libqtest.c:203: kill_qemu() detected QEMU death 
from signal 6 (Aborted) (core dumped)

(test program exited with status code -6)

TAP parsing error: Too few tests run (expected 3, got 0)
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

...

  HTH,
   Thomas

