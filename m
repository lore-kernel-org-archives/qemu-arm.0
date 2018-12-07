Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp254303wrt;
        Fri, 7 Dec 2018 01:22:10 -0800 (PST)
X-Received: by 2002:a2e:8596:: with SMTP id b22-v6mr895136lji.122.1544174530857;
        Fri, 07 Dec 2018 01:22:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544174530; cv=none;
        d=google.com; s=arc-20160816;
        b=eQBwhEpq9RRB7F0yPxVfmcSktmwOktqYI3QU8G1F3z3sciF4q19y69w6pTWHBnZwj4
         kUqlS/r16bfDGLTvFvH4MwCEOUi//3FsRKo8YFX0xBFPeuzdpQlM2SUfOJ8oHy+h12nh
         mgN3gnD7FNtMhZ+bfgkGsksZU+azgFhS8dR8KQ5ngYxK8ZVQi1k70BwS4QMwdxZzpdRs
         M2ExgGB+3ZMfvWB5Eo3K/4dWV050uboXS9gjrL13oszgMa1pT3wfzeXUdV561jdNDDSi
         LYZL+l4rAUuHTTurwROlqDd/uJqBi0SjY1u9mEnbZxBi2QLXdgrk+GtN1uR6aTV39KLe
         aQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CfiE0qGGU9euRvfJM82zJnfZ/2yPc+nzAmuXA5cO1no=;
        b=rCmm/4SiZdPGw74azXXvDBg39WynhT+g0cuy4zoiykiWhpVENh92Wj1Dm9x/1HaOJS
         x1T97pbgKCuYkGabHqUyNTU9EqtUcMHHlTVDdrIYf+cMxqzmz8MfdkXIjRyML1BpmSKS
         NQK+L7C2cDaTiXEIAFwM1tEW0s241z0AXZmaltsGLvz74KZERga/MlZ3aqoNs9YcaYXd
         VNMnjC1s2lDJTTEiufTuZG6ecGb6XYZlgNZNa0E1gT+pWoK79Ia9KCs7Scr3qG6xnUCD
         UvxPiaYssVgSZcm+JBbRzri+6M6iY6ikqnxxYOxleXE7TiFq9EdMJEGNCfr1LcJXDTcZ
         Nilg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0jWp5Z3;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f8-v6sor2009340ljg.0.2018.12.07.01.22.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Dec 2018 01:22:10 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0jWp5Z3;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CfiE0qGGU9euRvfJM82zJnfZ/2yPc+nzAmuXA5cO1no=;
        b=G0jWp5Z36sFvTQ2N9LpgVsCl8SzD6WIejaQLcCWSISlfP6zPpNKxG0gh1TQfi0GGS1
         B2RoEdnh61oURFMJKYBItkhGGFxdOkCVukfJqgK8XNw8YLEeLr9okafCYxvZAtFAIuen
         TId7jGHZXPFWNEAy6ua2UQ1mpmwRdN9Ggo06A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CfiE0qGGU9euRvfJM82zJnfZ/2yPc+nzAmuXA5cO1no=;
        b=QmGcqy8+8SQ1sJvb6Hhvplb+uezO/PqbG03iRcRrDGHRd1GzhDzW6TrDBN4IvwaTvk
         qYfmy1erClO3HfMISCs8JFhN+o+pG12XsDS3DMqKPIHXvuWNsr89ajleMSI3usiuABB7
         JhYZBHC/qR304kwq66/hRJMiqcqAuDXN26GwHkmvKLanNzkV/vBJNjSVmYby9212B5g5
         EAMnms/R1lwqWM/CJYOafuB59hZNHDywUXlFB5wwdilwZML8pW5ERxuRF+j1d7RHEE28
         pPjfYYcDrwnICwezwUzc77gyPjRtcShUkvnRO9H5cL6abG4qj962VaGVGCM03rh7iMqd
         ZB3g==
X-Gm-Message-State: AA+aEWZHXwio++U0ENgKlZrLu+NDeoKKBloO/B3MFBSNdvzbah4ffF6k
	rQytn+v4eHHMc/HXil1iW0PB9vfWoF9mbwqgLR6ErXLt
X-Google-Smtp-Source: AFSGD/XTtJ+6cDkueqFyiovJ/HYdK5BysQ1AKPkJ9mfSqx4vYbsA7/ciddSWKSk6KHmkCPR2tSV6oV3GElqxUllml6A=
X-Received: by 2002:a2e:145a:: with SMTP id 26-v6mr851254lju.116.1544174530304;
 Fri, 07 Dec 2018 01:22:10 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
In-Reply-To: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 7 Dec 2018 17:21:58 +0800
Message-ID: <CAHmQWvD1wKQaUZbmYX0SQ0fPfwPjNxZk+DNbXBBKG4DvYuVtrA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] [PATCH v4] Add arm SBSA reference machine
To: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: mALlPrqSNkrZ

Sorry for the redundant "[PATCH v4]" in the title line, it was due to
copy-paste from last iteration, that should be only "[PATCH v5 0/2]".

On Fri, 7 Dec 2018 at 17:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware,  to support
> firmware and OS development for pysical Aarch64 machines.
>
> This machine comes with:
>  - Re-designed memory map.
>  - CPU cortex-a57.
>  - EL2 and EL3 enabled.
>  - GIC version 3.
>  - System bus AHCI controller.
>  - System bus XHCI controller(TBD).
>  - CDROM and hard disc on AHCI bus.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - Only minimal device tree nodes.
> And without:
>  - virtio deivces.
>  - fw_cfg device.
>  - ACPI tables.
>
> Arm Trusted Firmware and UEFI porting to this are done accordingly, and
> it should supply ACPI tables to load OS, the minimal device tree nodes
> supplied from this platform are only to pass the dynamic info reflecting
> command line input to firmware, not for loading OS.
>
> v5 changes:
>  - removed more lines derived from virt.c
>  - designed a new memory map
>  - splitted former one patch into two for easier review
>  - cancled previous EHCI and new HXCI coming later separately
>
> V4 changes:
>  - rebased to v3.0.0
>  - removed timer, uart, rtc, *hci device tree nodes
>    (others were removerd in v3)
>  - other minore codes clean up, mainly unsed header files, comments etc.
>
> V3 changes:
>  - rename the platform 'sbsa-ref'
>  - move all the codes to a separate file sbsa-ref.c
>  - remove paravirtualized fw_cfg device
>  - do not supply ACPI tables, since firmware will do it
>  - supply only necessary DT nodes
>  - and other minor code clean up
>
> In the previous v4 cover letter,
> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg04282.html
> I mentioned I had to revert two commits temperarily to run:
>  Revert "target/arm: Implement new do_transaction_failed hook"
>  Revert "device_tree: Increase FDT_MAX_SIZE to 1 MiB"
>
> Now the 1st one is fixed by Ard Biesheuvel in the edk2 side, and for
> the 2nd one, a simple change in firmware side can fix it, so I won't
> mention these issues in details in the cover letter any more.
>
> I also put a branch here:
> http://git.linaro.org/people/hongbo.zhang/qemu-enterprise.git/log/?h=sbsa-upstream-v5
> with the last 3 workaroud we can test using legacy firmware
> but gicv3 needs to be enabled in ATF:
> http://git.linaro.org/people/hongbo.zhang/atf-sbsa.git/log/?h=sbsa_gicv3
>
> Hongbo Zhang (2):
>   hw/arm: Add arm SBSA reference machine, skeleton part
>   hw/arm: add Arm SBSA reference machine, devices part
>
>  hw/arm/Makefile.objs  |   2 +-
>  hw/arm/sbsa-ref.c     | 698 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |   1 +
>  3 files changed, 700 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/sbsa-ref.c
>
> --
> 2.7.4
>
