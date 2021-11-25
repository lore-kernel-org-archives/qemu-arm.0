Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h16sm3223873wrm.27.2021.11.25.07.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 07:19:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 849ED1FF96;
	Thu, 25 Nov 2021 15:19:51 +0000 (GMT)
References: <20211124182246.67691-1-shashi.mallela@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Cc: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
Date: Thu, 25 Nov 2021 15:18:45 +0000
In-reply-to: <20211124182246.67691-1-shashi.mallela@linaro.org>
Message-ID: <87v90gfejs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vMSm4d1dnB7Y


Shashi Mallela <shashi.mallela@linaro.org> writes:

> When Enabled bit is cleared in GITS_CTLR,ITS feature continues
> to be enabled.This patch fixes the issue.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>


Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

in so far as it doesn't break the kvm-unit-tests but it also doesn't
solve the:

  irq 55: nobody cared (try booting with the "irqpoll" option)
  CPU: 0 PID: 9 Comm: ksoftirqd/0 Not tainted 5.15.1-ajb #67
  Hardware name: linux,dummy-virt (DT)
  Call trace:
   dump_backtrace+0x0/0x1ac
   show_stack+0x18/0x24
   dump_stack_lvl+0x68/0x84
   dump_stack+0x18/0x34
   __report_bad_irq+0x4c/0x168
   note_interrupt+0x278/0x420
   handle_irq_event+0x84/0x1a0
   handle_fasteoi_irq+0x148/0x214
   handle_domain_irq+0x60/0x90
   gic_handle_irq+0xb0/0x120
   call_on_irq_stack+0x2c/0x5c
   do_interrupt_handler+0x40/0x58
   el1_interrupt+0x30/0x50
   el1h_64_irq_handler+0x18/0x24
   el1h_64_irq+0x78/0x7c
   finish_task_switch.isra.0+0x174/0x290
   __schedule+0x5e0/0x674
   __cond_resched+0x24/0x50
   run_ksoftirqd+0x44/0x5c
   smpboot_thread_fn+0x154/0x180
   kthread+0x118/0x130
   ret_from_fork+0x10/0x20
  handlers:
  [<0000000050cdc74a>] vring_interrupt
  Disabling IRQ #55

that is being seen on newer kernels.

--=20
Alex Benn=C3=A9e
