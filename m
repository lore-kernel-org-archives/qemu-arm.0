Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp35360lfm;
        Tue, 14 Jul 2020 18:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvjHdH0dKNglBmuaKglNq0WiqjHU73WJDfTmgap2FGFJhNW+OPOn6MbasA0G1Ls+YfBon0
X-Received: by 2002:a25:803:: with SMTP id 3mr9447763ybi.518.1594775022521;
        Tue, 14 Jul 2020 18:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594775022; cv=none;
        d=google.com; s=arc-20160816;
        b=vRSRlxrPkCmmF3kspE5WHmkO46pMtHyFmhR1+xmmBK41WeIDtu/B7IOrcuvufdNjpI
         v5ZaZFbu7rW0XVybX0sDSOqmpSJXtq+LeVJV5GqHkyP3zGXmYWPDYtNIZCdqcCjgoX6x
         ln4T47WEt7IZs0yvAFuvWYqnRIT3q/w5OobSxh7Wd2+o1SsUkrCesrQFKJqYI9MMhstk
         7XZW3kXwwU5D6xdvN82K/LPrzVAo50QBmOunRzCg1vsxmYEDk0ew7kqU0qT73YgEW0lk
         QOpUNEtY61YIBVW8U5GqWAsH7IfcqCr/nYIlAjGrbMa2+jQ9VNRNaJqU5li2igAv/XaL
         KAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=83BTdgqk2KTDBDoZVUCfxxT/ZpwNjfPo/xuQCgcojwQ=;
        b=DUipMYF8PpMeb8B9lBhT1l4IeVUrZPunLhCK2Yc8OzgEKGq6/38qz0C4U87D1xti7L
         QWM1Y6SZ43TXc6umGBnNaK8QN5oi3gutiOgFqtjbsQYFHMDDUQoAcAoepM6Tu+k+cKw3
         p1BmtlInPApFoZhp6etwIHgsNUlgLjZ+7McD7LdmPm1EEXl9q/woqQWDa7bJWTvGhTGG
         c65wEjTGTFIEg+6WXL6xparL7UmDnKl2JlAxDD+sFQymFqaP/AtS5keD0UetZGcW5/fs
         S0ll3Fjb9N2NFRihDR+juWFa8PmHmKgQuRKA8iHBRbQuOmZtEZFtq5wqf99cdecpbwbS
         e1fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=PnB+NWs5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si717780ybn.386.2020.07.14.18.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 18:03:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=PnB+NWs5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvVpl-0004Pv-Tq
	for alex.bennee@linaro.org; Tue, 14 Jul 2020 21:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jvVpd-0004Ni-4o
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 21:03:33 -0400
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41]:33875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jvVpb-0001z5-1Z
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 21:03:32 -0400
Received: by mail-vk1-xa41.google.com with SMTP id m21so81337vkp.1
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2020 18:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=83BTdgqk2KTDBDoZVUCfxxT/ZpwNjfPo/xuQCgcojwQ=;
 b=PnB+NWs5mX1L0TpgbOdGbU40mWfMZjK35zU7yRyUNhqCHctF1EAlXtVXB6lgHV0qEl
 G4/oN5JbaSQ5KxPDf1SDh3YvQDIZC+MpSgLFXIT45J1iG+BluziNx439QiOWuX1QLK51
 mdZ4YYiK/0F0/ppw3iv0QBgvKxEt5RMKcj3+wsABok4Bi9CaC53dtLKP2GOThGZiqIWp
 mHR8TAul4PgqsjP6dWaNxLxM4hiYI8cP2LgfREGoZkszVDlRWAbAMwnlaS4+PedP/jwX
 BLigfziqGg89INhGxuj6Z9Fyyy3VgBhWTrcrZvDKObd8MLzGWEjTvDa69TIV/eEtsD5l
 qO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=83BTdgqk2KTDBDoZVUCfxxT/ZpwNjfPo/xuQCgcojwQ=;
 b=EobLNXq2CfWV1miCH4YtzGbvJhCK7y7HBUJZq3wLM8FJ5WEy9Yex+tKL8UBHIe5JDC
 yyMAvCj3G+nX4ljTf06t2858VjrXbybqQssL0aKdme+DHVHR15HaqOhzH1DCHH56twiO
 truBSmxWyfeBxvYPydYW03TCQAos1ty4dQIHqLO7Wv1dPY+5u+ow4Sq21Zj4ABnH/Yxf
 W+vtjd/jAe4qMOwv9kb5QSSlrsTtOUhYSlfKN6CcdinRO6xgi707JGZZ0eMYPWEmnaBI
 TWXI2EDm+y5EF3p8QWJ5HQB82BZbkOqp2QLDVyPfricqIY3dCbjKVchhKtxZU1S8f9gY
 1veg==
X-Gm-Message-State: AOAM5320MUCtAIVCPuN/jTSQyWLVwbUDxHe8QqnvWa67wS6gF6BF01eD
 zH2pjUJcCPma9EGvsEw4/SuDHxc6cxmL8r2M3UnEjQ==
X-Received: by 2002:a1f:9144:: with SMTP id t65mr5983958vkd.50.1594775008092; 
 Tue, 14 Jul 2020 18:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-5-hskinnemoen@google.com>
 <3ec30463-03f8-98e9-9a14-01b0bb698c9b@kaod.org>
 <CAFQmdRYQxMz_qSr4i_cyqRPEGuq7At=VEOGvsupR3=W7pE3q=g@mail.gmail.com>
 <7c978e82-8890-9ba4-096a-92d7cff60b0a@amsat.org>
 <877dv63x2e.fsf@dusky.pond.sub.org>
 <11c410d4-b310-faf1-5116-2ab62270c3cb@amsat.org>
In-Reply-To: <11c410d4-b310-faf1-5116-2ab62270c3cb@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Tue, 14 Jul 2020 18:03:16 -0700
Message-ID: <CAFQmdRZKnP=NCzoVtPz5LFXFKrboTFxY1EWxOD_w9CCFd-dYiA@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] hw/arm: Add NPCM730 and NPCM750 SoC models
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a41;
 envelope-from=hskinnemoen@google.com; helo=mail-vk1-xa41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0cDSp0TWCvo+

On Tue, Jul 14, 2020 at 10:11 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 7/14/20 6:01 PM, Markus Armbruster wrote:
> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
> >
> >> +Markus
> >>
> >> On 7/14/20 2:44 AM, Havard Skinnemoen wrote:
> >>> On Mon, Jul 13, 2020 at 8:02 AM C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
> >>>>
> >>>> On 7/9/20 2:36 AM, Havard Skinnemoen wrote:
> >>>>> The Nuvoton NPCM7xx SoC family are used to implement Baseboard
> >>>>> Management Controllers in servers. While the family includes four S=
oCs,
> >>>>> this patch implements limited support for two of them: NPCM730 (tar=
geted
> >>>>> for Data Center applications) and NPCM750 (targeted for Enterprise
> >>>>> applications).
> >>>>>
> >>>>> This patch includes little more than the bare minimum needed to boo=
t a
> >>>>> Linux kernel built with NPCM7xx support in direct-kernel mode:
> >>>>>
> >>>>>   - Two Cortex-A9 CPU cores with built-in periperhals.
> >>>>>   - Global Configuration Registers.
> >>>>>   - Clock Management.
> >>>>>   - 3 Timer Modules with 5 timers each.
> >>>>>   - 4 serial ports.
> >>>>>
> >>>>> The chips themselves have a lot more features, some of which will b=
e
> >>>>> added to the model at a later stage.
> >>>>>
> >>>>> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> >>>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> >>>>> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> >>>>> ---
> >> ...
> >>
> >>>>> +static void npcm7xx_realize(DeviceState *dev, Error **errp)
> >>>>> +{
> >>>>> +    NPCM7xxState *s =3D NPCM7XX(dev);
> >>>>> +    NPCM7xxClass *nc =3D NPCM7XX_GET_CLASS(s);
> >>>>> +    int i;
> >>>>> +
> >>>>> +    /* CPUs */
> >>>>> +    for (i =3D 0; i < nc->num_cpus; i++) {
> >>>>> +        object_property_set_int(OBJECT(&s->cpu[i]),
> >>>>> +                                arm_cpu_mp_affinity(i, NPCM7XX_MAX=
_NUM_CPUS),
> >>>>> +                                "mp-affinity", &error_abort);
> >>>>> +        object_property_set_int(OBJECT(&s->cpu[i]), NPCM7XX_GIC_CP=
U_IF_ADDR,
> >>>>> +                                "reset-cbar", &error_abort);
> >>>>> +        object_property_set_bool(OBJECT(&s->cpu[i]), true,
> >>>>> +                                 "reset-hivecs", &error_abort);
> >>>>> +
> >>>>> +        /* Disable security extensions. */
> >>>>> +        object_property_set_bool(OBJECT(&s->cpu[i]), false, "has_e=
l3",
> >>>>> +                                 &error_abort);
> >>>>> +
> >>>>> +        qdev_realize(DEVICE(&s->cpu[i]), NULL, &error_abort);
> >>>>
> >>>> I would check the error:
> >>>>
> >>>>         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
> >>>>             return;
> >>>>         }
> >>>>
> >>>> same for the sysbus_realize() below.
> >>>
> >>> Hmm, I used to propagate these errors until Philippe told me not to
> >>> (or at least that's how I understood it).
> >>
> >> It was before Markus simplification API were merged, you had to
> >> propagate after each call, since this is a non hot-pluggable SoC
> >> I suggested to use &error_abort to simplify.
> >>
> >>> I'll be happy to do it
> >>> either way (and the new API makes it really easy to propagate errors)=
,
> >>> but I worry that I don't fully understand when to propagate errors an=
d
> >>> when not to.
> >>
> >> Markus explained it on the mailing list recently (as I found the doc
> >> not obvious). I can't find the thread. I suppose once the work result
> >> after the "Questionable aspects of QEMU Error's design" discussion is
> >> merged, the documentation will be clarified.
> >
> > The Error API evolved recently.  Please peruse the big comment in
> > include/qapi/error.h.  If still unsure, don't hesitate to ask here.
> >
> >> My rule of thumb so far is:
> >> - programming error (can't happen) -> &error_abort
> >
> > Correct.  Quote the big comment:
> >
> >  * Call a function aborting on errors:
> >  *     foo(arg, &error_abort);
> >  * This is more concise and fails more nicely than
> >  *     Error *err =3D NULL;
> >  *     foo(arg, &err);
> >  *     assert(!err); // don't do this
> >
> >> - everything triggerable by user or management layer (via QMP command)
> >>   -> &error_fatal, as we can't risk loose the user data, we need to
> >>   shutdown gracefully.
> >
> > Quote the big comment:
> >
> >  * Call a function treating errors as fatal:
> >  *     foo(arg, &error_fatal);
> >  * This is more concise than
> >  *     Error *err =3D NULL;
> >  *     foo(arg, &err);
> >  *     if (err) { // don't do this
> >  *         error_report_err(err);
> >  *         exit(1);
> >  *     }
> >
> > Terminating the process is generally fine during initial startup,
> > i.e. before the guest runs.
> >
> > It's generally not fine once the guest runs.  Errors need to be handled
> > more gracefully then.  A QMP command, for instance, should fail cleanly=
,
> > propagating the error to the monitor core, which then sends it to the
> > QMP client, and loops to process the next command.
> >
> >>> It makes sense to me to propagate errors from *_realize() and
> >>> error_abort on failure to set simple properties, but I'd like to know
> >>> if Philippe is on board with that.
> >
> > Realize methods must not use &error_fatal.  Instead, they should clean
> > up and fail.
> >
> > "Clean up" is the part we often neglect.  The big advantage of
> > &error_fatal is that you don't have to bother :)
> >
> > Questions?
>
> One on my side. So in this realize(), all &error_abort uses has
> to be replaced by local_err + propagate ...:
>
> static void npcm7xx_realize(DeviceState *dev, Error **errp)
> {
>     NPCM7xxState *s =3D NPCM7XX(dev);
>     NPCM7xxClass *nc =3D NPCM7XX_GET_CLASS(s);
>     int i;
>
>     /* CPUs */
>     for (i =3D 0; i < nc->num_cpus; i++) {
>         object_property_set_int(OBJECT(&s->cpu[i]),
>                                 arm_cpu_mp_affinity(i,
> NPCM7XX_MAX_NUM_CPUS),
>                                 "mp-affinity", &error_abort);
>         object_property_set_int(OBJECT(&s->cpu[i]), NPCM7XX_GIC_CPU_IF_AD=
DR,
>                                 "reset-cbar", &error_abort);
>         object_property_set_bool(OBJECT(&s->cpu[i]), true,
>                                  "reset-hivecs", &error_abort);
>
>         /* Disable security extensions. */
>         object_property_set_bool(OBJECT(&s->cpu[i]), false, "has_el3",
>                                  &error_abort);
>
>         qdev_realize(DEVICE(&s->cpu[i]), NULL, &error_abort);
>     }
>     [...]
>
> ... but the caller does:
>
> static void quanta_gsj_init(MachineState *machine)
> {
>     NPCM7xxState *soc;
>
>     soc =3D npcm7xx_create_soc(machine, QUANTA_GSJ_POWER_ON_STRAPS);
>     npcm7xx_connect_dram(soc, machine->ram);
>     qdev_realize(DEVICE(soc), NULL, &error_abort);
>                                     ^^^^^^^^^^^^
>     npcm7xx_load_kernel(machine, soc);
> }
>
> So we overload the code...
>
> My question: Do you confirm this is worth it to propagate?

Here's my understanding. Please let me know if it sounds right.

1. Internal code failing to set simple properties to predefined values
is a programming error, so error_abort is appropriate.
2. qdev_realize() may fail due to user input, so errors should be propagate=
d.
3. machine init can't propagate errors any further, so all errors are
fatal. But if all realize() functions follow (1) and (2), only user
errors are propagated, so error_fatal should be used to produce a nice
error message rather than "Unexpected error, aborting!"

If any of this can ever be hot-plugged, then it means errors may
propagate somewhere other than the machine init code, so it becomes
extra important not to let bad user input crash the whole qemu
process. I don't know if this is a concern when none of these devices
can currently be hot-plugged.

For example, if the user tries to create a machine with 64 MB RAM, the
gcr device will report an error because it can't represent less than
128 MB of memory. Currently, this is reported as

$ ./arm-softmmu/qemu-system-arm -machine npcm750-evb -nographic -m 64
Unexpected error in npcm7xx_gcr_realize() at
/usr/local/google/home/hskinnemoen/qemu/for-upstream/hw/misc/npcm7xx_gcr.c:=
151:
qemu-system-arm: npcm7xx_gcr: DRAM size 67108864 is too small (128 MiB mini=
mum)
Aborted

But if I change npcm7xx_realize() to propagate errors from
sysbus_realize(gcr), and change npcm750_evb_init() to use error_fatal
instead of error_abort, I get

$ ./arm-softmmu/qemu-system-arm -machine npcm750-evb -nographic -m 64
qemu-system-arm: npcm7xx_gcr: DRAM size 67108864 is too small (128 MiB mini=
mum)

which seems less scary and more accurate.

Havard
