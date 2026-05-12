Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A74BCD4F24
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 20:37:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMtqa-0006tM-2L; Tue, 12 May 2026 16:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wMtqL-0006go-VL
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:36:42 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wMtqK-0003Sl-6V
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:36:41 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-8b4000e51fdso59975366d6.1
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 13:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778618199; x=1779222999; darn=nongnu.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpsAZCSR7wni07d+1v7k4fHD1x0csRe7cXk1TEskBac=;
 b=aMFznEoaQpZDXqdw83c0FYEv3tHIf2aQXQr5W9Gz6aYfoFqcSUJLzJRdvOWlLGIILp
 KFupwjaNbRpKyV2E/78wULRPr4cCM7VYoMNkk0LQaEAGSV5RGnTNlHvt2BE0sIzQj3o4
 DXK9ls/ELCokBY5xhFIh7eAzYNpqCj0uIua+Z6thKIuessFb3uLVkIdcYW5VHGeC9e1S
 BHsKXwTfMlJfMJHKKFhQT9OQdCA1lJ3DM74AzxbzQESZ7xivj0ZjNFoTpRVJTzpfswVg
 GxykSZKpV5FzUlvX/K2NEFdJTKagKisx6hkboAdydi0UgvPIwXsPMb0JN7ONwEJt7uMZ
 OvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778618199; x=1779222999;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EpsAZCSR7wni07d+1v7k4fHD1x0csRe7cXk1TEskBac=;
 b=FSnGDzT4GSA222/Nmj6fRUc+pjgww8kkE5CQTzRZifbkgEFhw3QwH2Pvk1orwegIcj
 OiPw78gnUJLAxsUvrorB22MBo6GhJiUVv23YTLC/mCtc+0PybGlNgU2VUwUodqisTr9V
 L97sBFL/3dK71MMseJAbnOwkAH5xEcGUmXQed9t9EHWgj98JJrPhAXuD+3S431v1Ks/e
 q3N7AiXUMCnoe7dpohS2HCkqs3K1Zd20SLCvKRKDMeEHduXZcmGTTpPn494ajSsKuuwP
 Igk5vq18zAEG/LNvDuvhW1XOq39Gwtdzwv6Wzaz+8et8PcJZw9Ll+zmp9bTktLtpdT0s
 mwRA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jpnQNyFaISSL1Zcwd7oFjKqbdzHCLnkclRDiGm4wFJirERJTg1BlMwa3g2vxoum12wV/Rb645Dg==@nongnu.org
X-Gm-Message-State: AOJu0YwYbA+0fz539bPQZskiniyfJuieohiNM5um5RTZKoti0fy9/pTw
 gyhlTKKyZBfUO4HT04841I5HxHM5T77nS+XzSy8uLRvA/GBjnOujzChp
X-Gm-Gg: Acq92OEzmrkXo3y3f/XWOrHkgPsfnjMAy/CSjuIu++/0G9sLSEPO9urwFRoIaUFHpwm
 WcHhVffYW94nHOrqa0kzWiC+rSo0SdyxMa+fDK6QRB3b3Zhnoc8GnGS2vRgzkQUGtnqvLqI/ikr
 vTmZ3KtYQbQSrLx4lTwWPM+9rQYoh2g4P0XDuWx9WhDoZQAHwiV8HzNPjGc4y6beO2k+HjNqIPV
 tzal2pUOmwNTEfd1dqhckt9L/T/ULxB+TAFnBizKtsiO0mT5XAf00tsg5Bb+TOomOisTcg0ZEiq
 6IxsAqW3wbSuOrMYpLke0hZBu2geMMayCiUnyT4N2h0rcDe2EVHI8g23MCk4g13GQYSYCMEzdJy
 zXiri6aTef8TgSLPG7LNZK9lfz6egYz1fHkjduza21ngtLtvH3+rJe1gVv7tcOTcyXHdR9iDhnp
 Kg99uxCywx6+sQOthHuJeN8F6xJcIaaZswZ55s00zDpaFbxJ/W42A/Rgy6rQQsxhnRNznGr8GNO
 3c0SokLGYnvzkE=
X-Received: by 2002:a05:6214:403:b0:89c:4f67:8d17 with SMTP id
 6a1803df08f44-8c7b8cf5673mr9828956d6.8.1778618198896; 
 Tue, 12 May 2026 13:36:38 -0700 (PDT)
Received: from localhost ([2603:7000:4df0:8300:fdb5:4a2a:97d0:addf])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8c642e0d75asm34848786d6.41.2026.05.12.13.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 13:36:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 16:36:37 -0400
Message-Id: <DIGZJ3V3TPDK.3LY9W3NAULWWA@gmail.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Alexander Graf" <agraf@csgraf.de>, "Phil
 Dennis-Jordan" <phil@philjordan.eu>, "Roman Bolshakov"
 <rbolshakov@ddn.com>, =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v3] target/arm/hvf: Fix WFI halting to stop idle vCPU
 spinning
From: "Scott J. Goldman" <scottjgo@gmail.com>
To: "Mohamed Mediouni" <mohamed@unpredictable.fr>, "Scott J. Goldman"
 <scottjgo@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260410055045.63001-1-scottjgo@gmail.com>
 <20260427195516.46256-1-scottjgo@gmail.com>
 <794CB795-9462-4299-B7EC-528B0E4F1923@unpredictable.fr>
In-Reply-To: <794CB795-9462-4299-B7EC-528B0E4F1923@unpredictable.fr>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=scottjgo@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue May 12, 2026 at 1:54 PM EDT, Mohamed Mediouni wrote:
>
>
>> On 27. Apr 2026, at 21:55, Scott J. Goldman <scottjgo@gmail.com> wrote:
>>=20
>> Commit b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
>> changed hvf_wfi() from blocking the vCPU thread with pselect() to
>> returning EXCP_HLT, intending QEMU's main event loop to handle the
>> idle wait. However, cpu->halted was never set, so cpu_thread_is_idle()
>> always returns false and the vCPU thread spins at 100% CPU per core
>> while the guest is idle.
>>=20
>> Fix this by:
>>=20
>> 1. Setting cpu->halted =3D 1 in hvf_wfi() so the vCPU thread sleeps on
>>   halt_cond in qemu_process_cpu_events().
>>=20
>> 2. Arming a per-vCPU QEMU_CLOCK_VIRTUAL timer to fire when the guest's
>>   virtual timer (CNTV_CVAL_EL0) would expire. This is necessary
>>   because HVF only delivers HV_EXIT_REASON_VTIMER_ACTIVATED during
>>   hv_vcpu_run(), which is not called while the CPU is halted. The
>>   timer callback mirrors the VTIMER_ACTIVATED handler: it raises the
>>   vtimer IRQ through the GIC and marks vtimer_masked, causing the
>>   interrupt delivery chain to wake the vCPU via qemu_cpu_kick().
>>=20
>> 3. Clearing cpu->halted in hvf_arch_vcpu_exec() when cpu_has_work()
>>   indicates a pending interrupt, and cancelling the WFI timer.
>>=20
>> 4. Re-arming the WFI timer from hvf_vm_state_change() on the resume
>>   transition for any halted vCPU, since the QEMUTimer is per-instance
>>   state and is not migrated. After cpu_synchronize_all_states() the
>>   migrated vtimer state is mirrored in env, so we can read CNTV_CTL
>>   and CNTV_CVAL from there. If the vtimer has already expired by the
>>   time the destination resumes, hvf_wfi_timer_cb() is invoked
>>   directly so the halted vCPU is woken up.
>>=20
>> Fixes: b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
>> Signed-off-by: Scott J. Goldman <scottjgo@gmail.com>
>
> Hi,
>
> A bit of a side note for reproducing this:
>
> To reproduce this on current master, as far as I can tell you need either=
=20
> -M kernel-irqchip=3Doff or -M virt-11.0 or earlier. -M virt(-11.1) on mas=
ter uses=20
> the HVF vGIC path.

Just wanted to confirm that I re-tested and it seems like you are
correct. This must have changed semi recently? I was just running with
`-M virt` before. Either way, it's good that the defaults seem to work
better now. Either way, I guess the fix still needs to go in for the
non vGIC path?

