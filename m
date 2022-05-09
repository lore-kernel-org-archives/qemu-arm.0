Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j9-20020adff009000000b0020c5253d902sm11158232wro.78.2022.05.09.07.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 07:01:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A897F1FFB7;
	Mon,  9 May 2022 15:01:30 +0100 (BST)
References: <20220504152025.1785704-1-eric.auger@redhat.com>
 <20220504152025.1785704-4-eric.auger@redhat.com>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, david@gibson.dropbear.id.au,
 clg@kaod.org, eesposit@redhat.com, Coiby.Xu@gmail.com,
 stefanha@redhat.com, jean-philippe@linaro.org
Subject: Re: [PATCH v6 3/3] tests/qtest/libqos: Add generic pci host bridge
 in arm-virt machine
Date: Mon, 09 May 2022 14:59:23 +0100
In-reply-to: <20220504152025.1785704-4-eric.auger@redhat.com>
Message-ID: <87bkw6u7np.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: YTBiemqt5cJ4


Eric Auger <eric.auger@redhat.com> writes:

> Up to now the virt-machine node contains a virtio-mmio node.
> However no driver produces any PCI interface node. Hence, PCI
> tests cannot be run with aarch64 binary.
>
> Add a GPEX driver node that produces a pci interface node. This latter
> then can be consumed by all the pci tests. One of the first motivation
> was to be able to run the virtio-iommu-pci tests.
>
> We still face an issue with pci hotplug tests as hotplug cannot happen
> on the pcie root bus and require a generic root port. This will be
> addressed later on.
>
> We force cpu=3Dmax along with aarch64/virt machine as some PCI tests
> require high MMIO regions to be available.

Where would I be able to force disable-legacy=3Doff for the PCI device
from? Building on this for GPIO I run into the following:

  subprocess_run_one_test: /aarch64/virt/generic-pcihost/pci-bus-generic/pc=
i-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-=
mem/memfile/subprocess
  vhost_user_test_setup: -M virt, -cpu max -device vhost-user-gpio-pci,id=
=3Dgpio0,addr=3D04.0,chardev=3Dchr-vhost-user-test
  vu_gpio_get_protocol_features: 0x202
  qemu-system-aarch64: -device vhost-user-gpio-pci,id=3Dgpio0,addr=3D04.0,c=
hardev=3Dchr-vhost-user-test: Device doesn't support modern mode, and legac=
y mode is disabled
  Set disable-legacy to off
  Broken pipe

and I think this needs to be applied to the root bus device?

Anyway otherwise it looks OK to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
