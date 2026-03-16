Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E93F53D99
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Mar 2026 20:34:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2Eda-0005nr-NN; Mon, 16 Mar 2026 16:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fuzztheworld@gmail.com>)
 id 1w28iZ-0002Iq-0C
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 10:14:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fuzztheworld@gmail.com>)
 id 1w28iW-0007JL-RD
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 10:14:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso43868515e9.0
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2026 07:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773670483; cv=none;
 d=google.com; s=arc-20240605;
 b=OtdzfsndWKf9jmVS6yz2ri5EHXKLX8h1eZNwrWizutCwP8dH6Kxdo1NyQcwmo4ywFI
 nUdQLe4JIU5VvrvthkoM27Aqcj485Jxqh5aOXlr7cgz7LysjHUIDq3JvxHjzoQRp6CZz
 BetC3XZLHeBCqV7OwVjMBowncG0kq1nmMqO0cBkuHnyOWmPnvUK7aqZJZzFzgsP/kmqE
 QtSrmVqzVhtxyoVLTR5Z65BJ2KBbsTGG+xx7l9gHHIfydUKeDlleQWCHJ6Hp9uxdUfRX
 Ww1kV8d71LO1Gxwk0w9xzqkW8idMbD0xKWRWqU2fGBH99hoRDhJZHQky+0KAhopgJKCB
 dDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=0iaC1HDFqAhNmpKN3AIAcsObgoV6Z0/5DbAAQ6FWwPc=;
 fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
 b=gdvi4j+Ly8qf7gIuBGSU/9ssv8W4ezzmwR+LSQD3hj3NFvJdS5XSep18o8cdDxTUhT
 75E+9HYrFsq4DG4iMxlBpGM0Ys+J9bKS0ptCT7/aEJr50n6NXvfrzyKokeKWfRMN5rYy
 3HE+7p6an8uSkXRvLFK4RnGvYap9g7ysrRdSIKO13t82YbZ0AVF0EXjYl72n9Q5ELrE6
 wglzQLJ/hTh/J6jPGVexKTBr+iuxQbzKadM/d4iPU+RS3BwRGAAxu7wG/pSQPQhCTsE8
 QqILbnpo9mv8+Iis69e+yt7wWZzTulOAK2m2dtzff7Hgh9WTFGb1IQDXRvfRBBY2C2LO
 3j1A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773670483; x=1774275283; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0iaC1HDFqAhNmpKN3AIAcsObgoV6Z0/5DbAAQ6FWwPc=;
 b=nTPjYPLBVSYqnsMIlpPxIZivyQdRoIBVzML+/XAevnF/qokaPUC3tutHyxureOMUWS
 X2t2AzE9WCccrJ2l86uESllYHqdNYyaY58gD8jLvCOXpVRT66F5uzDOE7mXwfEIUiZ9b
 7TTLGIIWpp/rcrE6Orip5WduBj8lsEFZviGlm2KGarfG68cR36TAgYpKc0oa5FI9IjIo
 0beDMsvR0qbXBaQEH4A7fcGnaUk6awFRmP/dwzS2RIeWrXXMdCoQ3J5l0yEDJckx4fc8
 PUi067tUOq3wjtkXwCqAaZcU9Ovy87NrHWOVh7lziVC/MbKsLdCVELUXvXrfWi9ih8Vx
 Oecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773670483; x=1774275283;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0iaC1HDFqAhNmpKN3AIAcsObgoV6Z0/5DbAAQ6FWwPc=;
 b=Z37zMfFH00E1BMP35LE9kFQ/ytcAmIt1cT0G88k8aQLOCt0FhzWYcn8HRxgEJBCJ8/
 5bhsa8ViUlyguiJz9fa2yrDTTCKuR9LuSgz2OfUQsspR/Ym65qq0Ou/Q7e6bFfArcOP8
 9M1EbdEjbaeUa5qc54Ziu9fHERgJ9jdGsCn96+TdwYNexQdaxGaUGVFxhzfv48dPuD4q
 9ftc5pmQAuIqvXET2OA53eF+w4F5DY6i1r1jv/p5mKmTR3lhPtkvcFwisTrj6dDL5iQo
 tpupJ4yXn42ii5QebEE2Q0Vm4q3BHva2pZtr28kPUC6nsIZN7edi0vbW1kmc7ort4hhs
 J04g==
X-Gm-Message-State: AOJu0YwNpeohFv/cZKgIiC4VJV+ijSsnH28NUvNPjATpB+ujTX78F6Pf
 Eq+7M+KhWJu9qiSEc+w5OfYmlW72aWorjsCQui2II+FVBvAzhRTIK5pPypEXAOLhYIiNHqA/SRM
 dHoOYNuEMh03VIpXy+F9ZJ1ZtjFk84/mK81SLgIM=
X-Gm-Gg: ATEYQzxPKR8599+gMiGwMqdFQq6Xknk7eusOoKEMppSJutPZZWUs1LSN1tIuN/g2zjA
 eSN9VTgiJ3R7ZpR/fV3xY65JAtlJDYGQPGR1gGEGV2uwvNPly4L8h1c+QY/Ic+m329DgA1I3fb+
 4QYo+lhSf5IcdvHDBy1CTNTaVRyNDJD2OABwjcu9hzNkGiIHIWvQ6FoGRQ5ICbrG9hvJrq7lEJ+
 Svn6ydr81YL942a4N6yuJVJLV6CSqzLLBd3Q3L7Qsq7wXCXnTGSNqYDwIQ/Vay11t+lh0u25uNT
 l0RwssGKGZL0NEEClQ==
X-Received: by 2002:a05:600c:4752:b0:485:38f1:5cec with SMTP id
 5b1f17b1804b1-48555ac714fmr216302055e9.7.1773670482023; Mon, 16 Mar 2026
 07:14:42 -0700 (PDT)
MIME-Version: 1.0
From: Piou Piou <fuzztheworld@gmail.com>
Date: Mon, 16 Mar 2026 15:14:30 +0100
X-Gm-Features: AaiRm51nwfzilvccujpo2duR6TAk2708u0iT_r-GyONnH2atyKOMglUVor3Yp9M
Message-ID: <CA+npmebHwcuek2M_Rx=raez9LNQu-gPA=Trn2rmSyK0SJxXozA@mail.gmail.com>
Subject: Question about ARM condexec_bits
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000799c8064d24d760"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=fuzztheworld@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 16 Mar 2026 16:34:04 -0400
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

--0000000000000799c8064d24d760
Content-Type: text/plain; charset="UTF-8"

Hello,

*Context*
I have a bug on unicorn that uses an old qemu version (
https://github.com/unicorn-engine/unicorn/issues/2309)
I thought I might fix it by looking at how qemu evolved since then.
Unfortunately, I did not see any fix.
And the more I looked at it, the more it looked like a qemu bug that would
still be here.

*Code*
The bug happens with an IT block containing a conditional load (executed)
and a branch (called) in it or just afterwards.
For instance, I have the following arm code (with thumb mode):
```c
0x72   93 bf           iteet      ls              // The originating itt
0x74   00 68           ldr.ls     r0,[r0,#0x0]    // executed
0x76   80 68           ldr.hi     r0,[r0,#0x8]    // skipped
0x78   28 39           sub.hi     r1,#0x28        // skipped
0x7a   2c f0 93 b9     b.ls.w     <some_func> // called
0x7e   2c f0 79 ba     b.w        <other_func>
```
The IT block is finely translated.
Then, the first ldr at 0x74 is executed. In unicorn a restore_state() call
is forced on that point as I use hooks on memory reads.
But I guess it would be the same if the load led to a data abort (as hinted
by the comment in function arm_tr_tb_start())

*Bug*
This restore_state() call restores in the env the condexec_bits of
instruction 0x74, so a value of 0x93 meaning we are inside and at the
beginning of the IT block.
Then this condexec_bits is passed through cpu_get_tb_cp_state_arm(), then
arm_tr_init_disas_context() and turned into condexec_mask and condexec_cond
that are put in the current dc.
Those condexec_mask and condexec_cond are then used when translating the
instruction pointed by the branch at 0x7a (new TB), leading to bad
emulation as those instructions are out of the IT block.

*Explanation*
There is a very explanatory comment at the beginning of arm_tr_tb_start
which says that the condexec_bits at reset at the beginning of a tb.
The case described above is explained as:
```c
/*
     * (3) if we leave the TB unexpectedly (eg a data abort on a load)
     * then the CPUARMState will be wrong and we need to reset it.
     * This is handled in the same way as restoration of the
     * PC in these situations; we save the value of the condexec bits
     * for each PC via tcg_gen_insn_start(), and restore_state_to_opc()
     * then uses this to restore them after an exception.
*/
```
But once this is done, the condexec_bits remain and are used to translate
the basic block pointed by the next branch if it is close enough.

*Solution*
The only solutions I see are:
1) Remove the restoration of condexec_bits in restore_state_to_opc
2) Maybe do something similar to arm_tr_tb_start() when restoring an
instruction.
3) Decrease the condexec_mask at every executed instruction.

Thank you for your time.
What do you think?

Best regards

--0000000000000799c8064d24d760
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div><u>Context</u></div><div>I have =
a bug on unicorn that uses an old qemu version (<a href=3D"https://github.c=
om/unicorn-engine/unicorn/issues/2309">https://github.com/unicorn-engine/un=
icorn/issues/2309</a>)</div><div>I thought I might fix it by looking at how=
 qemu evolved since then.</div><div>Unfortunately, I did not see any fix.</=
div><div>And the more I looked at it, the more it looked like a qemu bug th=
at would still be here.</div><div><br></div><div><u>Code</u></div><div>The =
bug happens with an IT block containing a conditional load (executed) and a=
 branch (called) in it or just afterwards.</div><div>For instance, I have t=
he following arm code (with thumb mode):</div><div>```c</div><div>0x72=C2=
=A0 =C2=A093 bf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iteet =C2=A0 =C2=A0 =C2=
=A0ls =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// The originating it=
t<br>0x74=C2=A0 =C2=A000 68 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"h=
ttp://ldr.ls">ldr.ls</a> =C2=A0 =C2=A0 r0,[r0,#0x0]=C2=A0 =C2=A0 // execute=
d<br>0x76=C2=A0 =C2=A080 68 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldr.hi =C2=
=A0 =C2=A0 r0,[r0,#0x8] =C2=A0 =C2=A0// skipped =C2=A0 <br>0x78=C2=A0 =C2=
=A028 39 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sub.hi =C2=A0 =C2=A0 r1,#0x28 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0// skipped<br>0x7a=C2=A0 =C2=A02c f0 93 b9 =C2=
=A0 =C2=A0 b.ls.w =C2=A0 =C2=A0 &lt;some_func&gt; // called<br>0x7e=C2=A0 =
=C2=A02c f0 79 ba =C2=A0 =C2=A0 b.w =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;other_fu=
nc&gt;</div><div>```</div><div>The IT block is finely translated.</div><div=
>Then, the first ldr at 0x74 is executed. In unicorn a restore_state() call=
 is forced on that point as I use hooks on memory reads.</div><div>But I gu=
ess it would be the same if the load led to a data abort (as hinted by the =
comment in function arm_tr_tb_start())</div><div><br></div><div><u>Bug</u><=
/div><div>This restore_state() call restores in the env the condexec_bits o=
f instruction 0x74, so a value of 0x93 meaning we are inside and at the beg=
inning of the IT block.</div><div>Then this condexec_bits is passed through=
 cpu_get_tb_cp_state_arm(), then arm_tr_init_disas_context() and turned int=
o condexec_mask and condexec_cond that are put in the current dc.</div><div=
>Those condexec_mask and condexec_cond are then used when translating the i=
nstruction pointed by the branch at 0x7a (new TB), leading to bad emulation=
 as those instructions are out of the IT block.</div><div><br></div><div><u=
>Explanation</u></div><div>There is a very explanatory comment at the begin=
ning of=C2=A0arm_tr_tb_start which says that the condexec_bits at reset at =
the beginning of a tb.</div><div>The case described above is explained as:<=
/div><div>```c</div><div>/*</div><div>=C2=A0 =C2=A0 =C2=A0* (3) if we leave=
 the TB unexpectedly (eg a data abort on a load)<br>=C2=A0 =C2=A0 =C2=A0* t=
hen the CPUARMState will be wrong and we need to reset it.<br>=C2=A0 =C2=A0=
 =C2=A0* This is handled in the same way as restoration of the<br>=C2=A0 =
=C2=A0 =C2=A0* PC in these situations; we save the value of the condexec bi=
ts<br>=C2=A0 =C2=A0 =C2=A0* for each PC via tcg_gen_insn_start(), and resto=
re_state_to_opc()<br>=C2=A0 =C2=A0 =C2=A0* then uses this to restore them a=
fter an exception.</div><div>*/</div><div>```</div><div>But once this is do=
ne, the condexec_bits remain and are used to translate the basic block poin=
ted by the next branch if it is close enough.</div><div><br></div><div><u>S=
olution</u></div><div>The only solutions I see are:</div><div>1) Remove the=
 restoration of condexec_bits in restore_state_to_opc</div><div>2) Maybe do=
 something similar to=C2=A0arm_tr_tb_start() when restoring an instruction.=
</div><div>3) Decrease the condexec_mask at every executed instruction.</di=
v><div><br></div><div>Thank you for your time.</div><div>What do you think?=
</div><div><br></div><div>Best regards</div><div><br></div></div>

--0000000000000799c8064d24d760--

