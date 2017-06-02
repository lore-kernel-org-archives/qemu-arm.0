Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b8sm24904470wrb.7.2017.06.02.08.48.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Jun 2017 08:48:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 1B5213E00B4;
	Fri,  2 Jun 2017 16:49:07 +0100 (BST)
References: <1493314727-6951-1-git-send-email-wei@redhat.com> <CAFEAcA-KKvhspYza=8TNNuFtqzco=ChhtS6Aa5hnn8=Cb036-Q@mail.gmail.com> <4dbaaea9-7576-9acf-5327-b22db6f00ed2@redhat.com> <CAFEAcA8K9DENSPqJD2Okqjqyi7T8RhSBmhCa3ztooJK5xdcZVg@mail.gmail.com> <8b782ee5-3545-3cb5-3b09-209fcffee7e4@redhat.com> <CAFEAcA8GY3yqZCVHihcFaFS-EkmEy+FRJ9+Kq_xRRdzD7+6DnQ@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.2
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Wei Huang <wei@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH 0/2] Fix compilation dependency issues of CONFIG_ARM_V7M
In-reply-to: <CAFEAcA8GY3yqZCVHihcFaFS-EkmEy+FRJ9+Kq_xRRdzD7+6DnQ@mail.gmail.com>
Date: Fri, 02 Jun 2017 16:49:07 +0100
Message-ID: <87k24us83w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: sttX/TNqMSqb


Peter Maydell <peter.maydell@linaro.org> writes:

> On 28 April 2017 at 14:58, Wei Huang <wei@redhat.com> wrote:
>> Using #ifdef is indeed a cleaner solution. However I can't use "#ifdef
>> CONFIG_ARM_V7M" & co inside target/arm/cpu.c file because CONFIG_xxx
>> aren't available as preprocessor directives. From what I saw the
>> CONFIG_xxx options can only control compiling source file. One solution
>> is to extract out all v7M code into separate files and use
>> CONFIG_ARM_V7M to direct compilation. A bit messy though. Any other
>> suggestions?
>
> We seem to run into "CONFIG_FOO is defined for make but not
> for the C preprocessor" from time to time, so maybe we should
> fix that?

Hmm is should be auto-generated from config-(host|target).mak but I've
never quite figured out why we need timestamps rather than a straight
dependency check in rules.mk:

  # Generate timestamp files for .h include files

  config-%.h: config-%.h-timestamp
          @cmp $< $@ >/dev/null 2>&1 || cp $< $@

  config-%.h-timestamp: config-%.mak $(SRC_PATH)/scripts/create_config
          $(call quiet-command, sh $(SRC_PATH)/scripts/create_config < $< > $@,"GEN","$(TARGET_DIR)config-$*.h")

This seems to be one of those things that goes away on a make clean && rebuild

--
Alex Bennée
