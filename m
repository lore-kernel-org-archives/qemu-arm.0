Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9383344lfc;
        Fri, 29 Nov 2019 10:36:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDYqvRHRowcBDIJsuzUsOuRSf10KxKMfMY2v7xMPujKPuN/gCglq6p3jVAhiUSZNf0Nuzp
X-Received: by 2002:a05:6402:17e7:: with SMTP id t7mr40222077edy.114.1575052577004;
        Fri, 29 Nov 2019 10:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575052577; cv=none;
        d=google.com; s=arc-20160816;
        b=d/7TmrmnT4lYrzM/Ny97LY+QG5dHiGobSr+RfB63tWdzVeQeiLfQXM17eh4oaXXNJG
         MN9ZE22rsZbupVmrffhgfH8sbIugIbkhggY/AkeF1ULuqngj7Ib09rZupY0xpeCDsFIi
         o4TSJoiMbuBmiUjysYGkC8MA3M+kkEvvk6vyRyrjRJE2TBtDNWZc9UYWAfuEP4/COQ0j
         A5+7pXyF50okwg+2hZbzsJWg+bEoxYDb6xjNJXYVy8yNHRk1hTHgsnMYHjNjRsCoAauO
         FNnDOQTvRSMJyu223yX1JvXJNR/y1f0Bi6rvTx09msHCWcjv/rjulTL4bWK3VJ97WwKb
         WjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DBtTUmrLfUsY7qLVywVtzqUoA7i+kSBot4vgWq//N+k=;
        b=xxM12jTo42iW7jUpF8EYzbit9MP/8MOLxjfOuI3dmkY6YKwX0dPF3lvUYt8TuZ+7E1
         azAomEcQ1p9QYwlbqwAbfcB+Rl30HiKRCiGx/duyB+MIK+VH/MGZkTiaieYEmx1o64C0
         EhWRguAyJFZiptRhbwOkzEcs7k+2pd/ZnP+LRyyH7krdGBO6z1tKX3ZIjr7j9te8e6fG
         TP2cYIdDmRKVy1HLYGR1AUjy6nX+3paWOJVkSc0lmC8rr7tGRaVoFiyu1GuW6K859DND
         D8OtrNj0MDeBXpCn87AOQebueS4OYw17fzaUtJx3Hl5+VAtNZcYXUVIzbbG6d3QSW/Y7
         sDCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="IVk/sSHR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23si7483163eju.283.2019.11.29.10.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 10:36:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="IVk/sSHR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ial7j-000162-VK
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 13:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ial4i-0007uy-8K
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 13:33:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ial4a-0003JL-UR
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 13:32:58 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35700)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ial4a-0003Es-Jw
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 13:32:56 -0500
Received: by mail-ot1-x342.google.com with SMTP id o9so4476368ote.2
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2019 10:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DBtTUmrLfUsY7qLVywVtzqUoA7i+kSBot4vgWq//N+k=;
 b=IVk/sSHRFxt0Pvp1cDKNmjzYm8rPZlPE7ppxneW3by/AlHdlAWVU+nzmvJpj4yOUmI
 7nmQvsh7hR0l5hEA7kXDBNn6Q7oZK3SMhngX9EoDcootLMKfPznb4e43vEAcyoqXPT46
 QO3H35XhvlbM8fPfCl8gqv8qkkRckyCTYWFmacyS8m1JEt5UX5Q9Ma6xfvEEh+7xmW9u
 Uegg/c7YqjJiLCBlNfTXNg3xm6Ox7VU5iQtIk/MxfQN4OJO08Q0YThhEhf6LIHH/jow2
 tgeeYl+CNLZv+nLxX2uKEfpn7d3obRr2GQMukisIhR33d5ep7UvCcbXRK6mIQIKMwLsW
 DjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DBtTUmrLfUsY7qLVywVtzqUoA7i+kSBot4vgWq//N+k=;
 b=O8IYljyfesdB5Fm0QcioQpYGsQSSc4U+vOpcszGUzfpkmVGtNeFMPz35NydrQRdAmm
 F9snGKz+vnlQ6U/8dRG9XBxdIoYZU6r7mE507TNCe1+xRuYCc+cCnCZIPhHMdidXImOb
 ufAMOTw8thQpnwvSLmP99VReRcLiSUeYYHlKHc0+jR0IRjKiIOQO3JDMdLXlI/ut8uC2
 OVl2dX2Ypv6BnkJGPvxZmcU9LP3MR4l11iuujHO1/EfSZPS6Bbw8B6HVXo5jz4JO7AgE
 tS6kCo3jaa19f0YOdxpu+dNW2dJHxqH1JCq7O5gD4OqBhiAo2O0ksN130PxkCw4Q7aJZ
 +jmg==
X-Gm-Message-State: APjAAAWr1gu/QciWy3SI03OGvLI2u2tTTK1TLtuhDar2i0U7vZyTkkoH
 bK0Zam7v//tdzT3uBx9Are+wh/47ar/I1Tb1lLpwuA==
X-Received: by 2002:a05:6830:1583:: with SMTP id
 i3mr11305711otr.221.1575052375364; 
 Fri, 29 Nov 2019 10:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-4-damien.hedde@greensocs.com>
In-Reply-To: <20191018150630.31099-4-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Nov 2019 18:32:44 +0000
Message-ID: <CAFEAcA9kc1-=DkYSqL6DOrLCNKt5uuxnf6-XYJ97g15T--1NvA@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] hw/core: create Resettable QOM interface
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BnNYo/2gIBo9

On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> This commit defines an interface allowing multi-phase reset. This aims
> to solve a problem of the actual single-phase reset (built in
> DeviceClass and BusClass): reset behavior is dependent on the order
> in which reset handlers are called. In particular doing external
> side-effect (like setting an qemu_irq) is problematic because receiving
> object may not be reset yet.
>
> The Resettable interface divides the reset in 3 well defined phases.
> To reset an object tree, all 1st phases are executed then all 2nd then
> all 3rd. See the comments in include/hw/resettable.h for a more complete
> description. The interface defines 3 phases to let the future
> possibility of holding an object into reset for some time.
>
> The qdev/qbus reset in DeviceClass and BusClass will be modified in
> following commits to use this interface. A mechanism is provided
> to allow executing a transitional reset handler in place of the 2nd
> phase which is executed in children-then-parent order inside a tree.
> This will allow to transition devices and buses smoothly while
> keeping the exact current qdev/qbus reset behavior for now.
>
> Documentation will be added in a following commit.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> In this patch only a single reset type is supported, but the interface
> allows for more to be defined.
>
> I had some thought about problems which may arise when having multiple
> reset types:

[snip]

Yeah, these all seem right. We clearly need to think a bit
more before we add multiple reset types. Let's get this basic
just-cold-reset in for now and come back to the rest later.


Almost all of my comments below are just grammar/typo fixes
for comments. The only substantives are:
 * globals
 * copyright/licensing comment needed in the .h file
and they're pretty minor items.

> +/**
> + * enter_phase_in_progress:
> + * Flag telling whether we are currently in an enter phase where side
> + * effects are forbidden. This flag allows us to catch if reset is called
> + * again during during this phase.
> + */
> +static bool enter_phase_in_progress;

This looks weird -- I don't think a global for this works,
because you might have several distinct subtrees of
devices, and be doing reset on them both at once.
I think that we only use this for an assert, though -- is
that right? If so, we could just drop this.

> +void resettable_assert_reset(Object *obj, ResetType type)
> +{
> +    assert(!enter_phase_in_progress);
> +    /* TODO: change that assert when adding support for other reset types */

I'm not sure which assert this is referring to -- the one above
the comment, or the one below ?

> +    assert(type == RESET_TYPE_COLD);
> +    trace_resettable_reset_assert_begin(obj, type);
> +    enter_phase_in_progress = true;
> +    resettable_phase_enter(obj, NULL, type);
> +    enter_phase_in_progress = false;
> +    resettable_phase_hold(obj, NULL, type);
> +    trace_resettable_reset_assert_end(obj);
> +}
> +
> +void resettable_release_reset(Object *obj, ResetType type)
> +{
> +    assert(!enter_phase_in_progress);
> +    /* TODO: change that assert when adding support for other reset types */

Ditto.

> +    assert(type == RESET_TYPE_COLD);
> +    trace_resettable_reset_release_begin(obj, type);
> +    resettable_phase_exit(obj, NULL, type);
> +    trace_resettable_reset_release_end(obj);
> +}
> +

> +static void resettable_phase_enter(Object *obj, void *opaque, ResetType type)
> +{
> +    ResettableClass *rc = RESETTABLE_GET_CLASS(obj);
> +    ResettableState *s = rc->get_state(obj);
> +    const char *obj_typename = object_get_typename(obj);
> +    bool action_needed = false;
> +
> +    /* exit phase has to finish properly before entering back in reset */
> +    assert(!s->exit_phase_in_progress);
> +
> +    trace_resettable_phase_enter_begin(obj, obj_typename, s->count, type);
> +
> +    /* Only take action if we really enter reset for the 1st time. */
> +    /*
> +     * TODO: if adding more ResetType support, some additional checks
> +     * are probably needed here.
> +     */
> +    if (s->count++ == 0) {
> +        action_needed = true;
> +    }
> +    /*
> +     * We limit the count to an arbitrary "big" value. The value is big
> +     * enough not to be triggered nominally.

"normally"

> +     * The assert will stop an infinite loop if there is a cycle in the
> +     * reset tree. The loop goes through resettable_foreach_child below
> +     * which at some point will call us again.
> +     */
> +    assert(s->count <= 50);
> +
> +    /*
> +     * handle the children even if action_needed is at false so that
> +     * children counts are incremented too

"child counts"

> +     */
> +    resettable_child_foreach(rc, obj, resettable_phase_enter, NULL, type);
> +
> +    /* execute enter phase for the object if needed */
> +    if (action_needed) {
> +        trace_resettable_phase_enter_exec(obj, obj_typename, type,
> +                                          !!rc->phases.enter);
> +        if (rc->phases.enter && !resettable_get_tr_func(rc, obj)) {
> +            rc->phases.enter(obj, type);
> +        }
> +        s->hold_phase_pending = true;
> +    }
> +    trace_resettable_phase_enter_end(obj, obj_typename, s->count);
> +}
> +

> +static void resettable_phase_exit(Object *obj, void *opaque, ResetType type)
> +{
> +    ResettableClass *rc = RESETTABLE_GET_CLASS(obj);
> +    ResettableState *s = rc->get_state(obj);
> +    const char *obj_typename = object_get_typename(obj);
> +
> +    assert(!s->exit_phase_in_progress);
> +    trace_resettable_phase_exit_begin(obj, obj_typename, s->count, type);
> +
> +    /* exit_phase_in_progress ensure this phase is 'atomic' */

"ensures"

> +    s->exit_phase_in_progress = true;
> +    resettable_child_foreach(rc, obj, resettable_phase_exit, NULL, type);
> +
> +    assert(s->count > 0);
> +    if (s->count == 1) {
> +        trace_resettable_phase_exit_exec(obj, obj_typename, !!rc->phases.exit);
> +        if (rc->phases.exit && !resettable_get_tr_func(rc, obj)) {
> +            rc->phases.exit(obj);
> +        }
> +        s->count = 0;
> +    }
> +    s->exit_phase_in_progress = false;
> +    trace_resettable_phase_exit_end(obj, obj_typename, s->count);
> +}


> --- /dev/null
> +++ b/include/hw/resettable.h
> @@ -0,0 +1,199 @@
> +#ifndef HW_RESETTABLE_H
> +#define HW_RESETTABLE_H
> +

All new files, including even small header files, should have
the usual copyright-and-license comment at the top. (Can you
check also whether this needs adding for any other new files the
patchset creates, please?)

> +#include "qom/object.h"
> +
> +#define TYPE_RESETTABLE_INTERFACE "resettable"
> +
> +#define RESETTABLE_CLASS(class) \
> +    OBJECT_CLASS_CHECK(ResettableClass, (class), TYPE_RESETTABLE_INTERFACE)
> +
> +#define RESETTABLE_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(ResettableClass, (obj), TYPE_RESETTABLE_INTERFACE)
> +
> +typedef struct ResettableState ResettableState;
> +
> +/**
> + * ResetType:
> + * Types of reset.
> + *
> + * + Cold: reset resulting from a power cycle of the object.
> + *
> + * TODO: Support has to be added to handle more types. In particular,
> + * ResettableState structure needs to be expanded.
> + */
> +typedef enum ResetType {
> +    RESET_TYPE_COLD,
> +} ResetType;

> + * @get_transitional_function: transitional method to handle Resettable objects
> + * not yet fully moved to this interface. It will be removed as soon as is not

"as soon as it is"

> + * needed anymore. This method is optional and may return a pointer to a
> + * function to be used instead of the phases. In case the method exists and

"If the method exists"

> + * returns a non-NULL function pointer; it is executed as a replacement of the

"pointer then that function is"

> + * 'hold' phase method taking the object as argument. The two other phase
> + * methods are not executed.
> + *
> + * @child_foreach: Executes a given callback on every Resettable child. Child
> + * in this context means a child in the qbus tree, so the children of a qbus
> + * are the devices on it, and the children of a device are all the buses it
> + * owns. This is not the same as the QOM object hierarchy. The function takes
> + * additional opaque and ResetType arguments which must be passed unmodified to
> + * the callback.
> + */

> +    /* Transitional method for legacy reset compatibility */
> +    ResettableGetTrFunction get_transitional_function;
> +
> +    /* Hiearchy handling method */

"Hierarchy"

> +    ResettableChildForeach child_foreach;
> +} ResettableClass;
> +typedef struct ResettablePhases ResettablePhases;
> +
> +/**
> + * ResettableState:
> + * Structure holding reset related state. The fields should not be accessed
> + * directly, the definition is here to allow further inclusion into other

"directly; the definition"


> + * objects.
> + *
> + * @count: Number of reset level the object is into. It is incremented when
> + * the reset operation starts and decremented when it finishes.
> + * @hold_phase_pending: flag which indicates that we need to invoke the 'hold'
> + * phase handler for this object.
> + * @exit_phase_in_progress: flag telling if currently in exit phase

"@exit_phase_in_progress: true if we are currently in the exit phase"

> + */
> +struct ResettableState {
> +    uint32_t count;
> +    bool hold_phase_pending;
> +    bool exit_phase_in_progress;
> +};
> +
> +/**
> + * resettable_reset:
> + * Trigger a reset on a object @obj of type @type. @obj must implement

"an object"

> + * Resettable interface.
> + *
> + * Calling this function is equivalent to calling @resettable_assert_reset()
> + * then @resettable_release_reset().
> + */
> +void resettable_reset(Object *obj, ResetType type);
> +
> +/**
> + * resettable_assert_reset:
> + * Put an object @obj into reset. @obj must implement Resettable interface.
> + *
> + * @resettable_release_reset() must eventually be called after this call.
> + * There must be one call to @resettable_release_reset() per call of
> + * @resettable_assert_reset(), with the same type argument.
> + *
> + * NOTE: Until support for migration is added, the @resettable_release_reset()
> + * must not be delayed. It have to occur just after @resettable_assert_reset()

"It must occur"

> + * so that migration cannot be triggered in between. Prefer using
> + * @resettable_reset() for now.
> + */
> +void resettable_assert_reset(Object *obj, ResetType type);
> +
> +/**
> + * resettable_release_reset:
> + * Release the object @obj from reset. @obj must implement Resettable interface.
> + *
> + * See @resettable_assert_reset() description for details.
> + */
> +void resettable_release_reset(Object *obj, ResetType type);
> +
> +/**
> + * resettable_is_in_reset:
> + * Return true if @obj is under reset.
> + *
> + * @obj must implement Resettable interface.
> + */
> +bool resettable_is_in_reset(Object *obj);
> +
> +/**
> + * resettable_class_set_parent_phases:
> + *
> + * Save @rc current reset phases into @parent_phases and override @rc phases
> + * by the given new methods (@enter, @hold and @exit).
> + * Each phase is overridden only if the new one is not NULL allowing to
> + * override a subset of phases.
> + */
> +void resettable_class_set_parent_phases(ResettableClass *rc,
> +                                        ResettableEnterPhase enter,
> +                                        ResettableHoldPhase hold,
> +                                        ResettableExitPhase exit,
> +                                        ResettablePhases *parent_phases);
> +
> +#endif

thanks
-- PMM
