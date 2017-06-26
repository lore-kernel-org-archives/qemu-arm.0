Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f45sm20891206wrf.2.2017.06.26.06.27.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 06:27:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 478083E0141;
	Mon, 26 Jun 2017 14:28:13 +0100 (BST)
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 0/4] cpu: Implement cpu_generic_new()
In-reply-to: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
Date: Mon, 26 Jun 2017 14:28:13 +0100
Message-ID: <87a84uyj2q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 9iEmDWkowrX1


Peter Maydell <peter.maydell@linaro.org> writes:

> This patchset adds a new function cpu_generic_new()
> which is similar to cpu_generic_init() except that it
> does not realize the created CPU object. This means that
> board code can do a "new cpu; set QOM properties; realize"
> sequence without having to do all the work of splitting
> the CPU model string and calling parse_features by hand.


Just going through my review queue and I see this needs re-basing. Is
there going to be another rev or was a different approach suggested?

>
> Patch 2 clarifies a TODO comment, hopefully correctly,
> based on an email conversation I had with Eduardo a
> little while back.
>
> Patches 3 and 4 change the ARM boards which currently
> call parse_features by hand to use the new function.
>
>
> If there's consensus that this is the right general
> direction to go in, then I think that some other
> architectures could also make cleanups to use this:
>  * cpu_s390x_create() is almost exactly this function,
>    give or take some fine detail of error handling
>  * ppc_cpu_parse_features is almost the same thing,
>    except that it doesn't actually create the CPU object,
>    it only calls parse_features
>  * hw/i386/pc.c does a manual parse_features
>
> I'm not strongly attached to this particular approach
> (though it seems like a reasonable one, especially given
> the proliferation of different arch-specific helpers
> listed above and the bugs in boards which don't call
> parse_features when they should), but I would like us to
> figure out and document what the right way for a board
> to create and configure its CPU objects is...
>
>
> Michael Davidsaver (1):
>   cpu: add cpu_generic_new()
>
> Peter Maydell (3):
>   cpu: Clarify TODO comment in cpu_generic_new()
>   hw/arm/integrator: Use new cpu_generic_new()
>   hw/arm/virt: Use new cpu_generic_new()
>
>  include/qom/cpu.h     | 17 +++++++++++++++++
>  hw/arm/integratorcp.c | 22 ++--------------------
>  hw/arm/virt.c         | 24 ++----------------------
>  qom/cpu.c             | 37 ++++++++++++++++++++++++++-----------
>  4 files changed, 47 insertions(+), 53 deletions(-)


--
Alex Bennée
