Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14fc98sm176355515e9.29.2025.06.17.02.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:49:38 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8FFEE5F834;
	Tue, 17 Jun 2025 10:49:37 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  thuth@redhat.com,
  eric.auger@redhat.com,  berrange@redhat.com
Subject: Re: [PATCH v5] tests/functional: Add PCI hotplug test for aarch64
In-Reply-To: <20250528203137.1654964-1-gustavo.romero@linaro.org> (Gustavo
	Romero's message of "Wed, 28 May 2025 20:31:37 +0000")
References: <20250528203137.1654964-1-gustavo.romero@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Tue, 17 Jun 2025 10:49:37 +0100
Message-ID: <87msa6vgsu.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Wc40AclW194G

Gustavo Romero <gustavo.romero@linaro.org> writes:

> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
> hot-unplug on arm64.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
