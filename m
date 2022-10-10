Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2472752ocg;
        Mon, 10 Oct 2022 07:27:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4H7mE4NtMRhUdzCFCDtJFpcgfWECkkklGnG10uam7zw4n6ndkamDuQdB1IOQKJdjgzhxk6
X-Received: by 2002:a05:622a:1982:b0:39a:1003:7405 with SMTP id u2-20020a05622a198200b0039a10037405mr4451224qtc.544.1665412035430;
        Mon, 10 Oct 2022 07:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665412035; cv=none;
        d=google.com; s=arc-20160816;
        b=YcgTo7ocjG4K2hKBUB8Ks290TxhSkRg8uyvqEcsI+uT2o5vMTwEXy16HWqsBVtKo8Z
         ECpHmqpa5eEmsyy3Qdmq9f2KhLpLRaQJCCB/YqXXWJBObHqmFVcZ5nR0ot9xKgsA0VrX
         UZFAkFsQ2jM/EEhx4WDEOBJtesur25DNJJH7Z4JH9S50dtA68PNAiztTl2HkA4nqgHlF
         0CmNM7Bn+BIKwi2F3aCdClDd4VZdaahDmErkCmXrQmod6CQ92YWTnvYnwoDOaGG16hCW
         2GJ7DB/LCrXwDuRphBja3zTVfJ9G/NgMx6i1M623LcB8AT0Ffqw7a0Km+lyLsfL/4xx/
         sAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=35KXoergDZSm9k5YDNkVFyn00KlEBRtkfFZuizY8sBI=;
        b=ll1nyMqTUjvnpNWV0j2dmJ6DhFhS+LmvFVNM8ItgTN1QHdO4oL4pCzSzCxUJMJRBPL
         mkcoUiZBGe5w+pn8hn7KebxpRetUqn69F11Vd0/W8ypgNryIOXNCGuoip8F2qNSDUTct
         1N9uRpZ51NVn2T9LygM2b74hUHA1CSKEV+z0KTlCyxKSVpwOnE9ehlWfAPSCG7mC9rkF
         vcv2aglH6UIfgAH2wo4v876Xh+gzOLjxdoPd6aobR/QGyQ5Rjiw9B4G6+fQOPLZqRFsa
         N7OZON7mWtNFFUUnmIs0brdaAX9z7PlYvyoN+84xPA3ihgyj2rJd0mrXfXltrMEnIcds
         hSeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZREpsGWW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq9-20020a056214258900b004b3d5499bfcsi4543173qvb.119.2022.10.10.07.27.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 07:27:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZREpsGWW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohtkQ-000595-U1
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 10:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohthd-0002Gw-MJ
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 10:24:21 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohthb-0004oB-Lg
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 10:24:21 -0400
Received: by mail-pl1-x636.google.com with SMTP id x6so10503886pll.11
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=35KXoergDZSm9k5YDNkVFyn00KlEBRtkfFZuizY8sBI=;
 b=ZREpsGWW3y6b+6Ft73u2HpOVsxWY5CGp06anHnl/1RazCPt/izkboQYxoBW5qLFuc5
 fqRf70MQ7okp59CM6FS3oZqRLXfWOv2bPQJNMeu/EQBBj5xUJ+bEbX80sDw+5Bdho6+B
 JKauhM2XyKcorqeKmQs01xRl/YsQ8S9JL2Ai59YeP5X9wsRak+J9sFBJQvZNJjo00iFR
 sn0sA4NeWNC+AQSSTDyzG6XvVNrKiLdmPSDhexJSUhumHhq8myEvOnZjVVQMGgUI/yWV
 F6LcX5wD9nPeHft6BXiF9ODT5GTim8sqZXslEE6yPG60y6TAE4OV7WX5b/YgEZHr8b2h
 vgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=35KXoergDZSm9k5YDNkVFyn00KlEBRtkfFZuizY8sBI=;
 b=yqyHg2X29IJNYV9e3gPrcM+dJwRNt5yKXalLo2HxZfgHW4HW8uI10jDvFsn9hdRbU6
 7IvMzwT4PmsIsBhJH26FU0V20PQa2mGW+5uJ1hKH1exFMDLA1UPoYiy8ehom08laPPWJ
 N5ykxeM9gzQbwtOu5z1G9cUUa2HVLZgBDtBhl15drc1v1DISMbRXge565lOYA3cIVRIJ
 izi3YTDNgm3DfbBuncmHActo1mcknWKweW8g4buTMAG31vtQQIO1fsLygYYcqqsFCC83
 fooq1S6u8ShdsFL5DMm6V2teiRVHa5lLBJuD5jMzMXxFeGZpDNo6HUKltgdgf+/smlQC
 WpZA==
X-Gm-Message-State: ACrzQf3QUTVzel/Y+0eZkIXSJD3S0OTLVq/6ED0kglM3xPvXki1GEGqj
 thFMAVrDrgadAOvFnCVAtcJ2XdPKQ1uiuDb8qnmdaA==
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr19188247plb.60.1665411857830; Mon, 10
 Oct 2022 07:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
 <20220920184619.3370115-2-zhangjian.3032@bytedance.com>
In-Reply-To: <20220920184619.3370115-2-zhangjian.3032@bytedance.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 15:24:05 +0100
Message-ID: <CAFEAcA8Dm8SaCp+0ubRzB3ck+e_89ir2nf1_3idMQ71zevbK3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/misc/latching_switch: Add a simple
 latching_switch device
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: f4bug@amsat.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, yulei.sh@bytedance.com, 
 tangyiwei.2022@bytedance.com, chentingting.2150@bytedance.com, 
 yuhao.17@bytedance.com, wangxiaohua.1217@bytedance.com, 
 xiening.xll@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b7fC1c2iZG+4

On Tue, 20 Sept 2022 at 19:46, Jian Zhang <zhangjian.3032@bytedance.com> wrote:
>
> Implement a simple latching switch device.
>
> The latching switch is a switch that can be turned on and off.
> When the input new state and match the trigger edge, the switch
> state will be toggled.
>
> This device privide 2 properties `state(bool)` and `trigger-edge(string)`,
> and 2 gpios `input` and `output`.
>
> The `state` property is the initial state of the switch, and the `trigger-edge`
> property is the edge that will trigger the switch state to be toggled,
> the value can be `rising`, `falling` or `both`.

> +static void toggle_output(LatchingSwitchState *s)
> +{
> +    s->state = !(s->state);
> +    qemu_set_irq(s->output, !!(s->state));

s->state is a bool so this !! is unnecessary.

> +}
> +
> +static void input_handler(void *opaque, int line, int new_state)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(opaque);
> +
> +    assert(line == 0);
> +
> +    if (s->trigger_edge == TRIGGER_EDGE_FALLING && new_state == 0) {
> +        toggle_output(s);

This won't have the correct behaviour, because the device
on the other end of this input line might call
qemu_set_irq() on it twice in a row with new_state == 0 both times.
It's only a falling edge if new_state is 0 and the old
input line state was not 0.

If you need to detect edges then you need to record the state
of the input line within LatchingSwitchState.

> +    } else if (s->trigger_edge == TRIGGER_EDGE_RISING && new_state == 1) {
> +        toggle_output(s);
> +    } else if (s->trigger_edge == TRIGGER_EDGE_BOTH) {
> +        toggle_output(s);
> +    }
> +}
> +
> +static void latching_switch_reset(DeviceState *dev)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(dev);
> +    /* reset to off */
> +    s->state = false;
> +    /* reset to falling edge trigger */
> +    s->trigger_edge = TRIGGER_EDGE_FALLING;

trigger_edge isn't guest-visible runtime modifiable state, it's how
the device or board configures the latch when it creates it, right?
Configuration shouldn't be reset, because if the board creates a
rising-edge switch, it should stay a rising edge switch even if the
guest power-cycles itself.

(If the QOM property can be changed at runtime things get more
complex, but in this case it can't be.)

> +}
> +
> +static const VMStateDescription vmstate_latching_switch = {
> +    .name = TYPE_LATCHING_SWITCH,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(state, LatchingSwitchState),
> +        VMSTATE_U8(trigger_edge, LatchingSwitchState),

trigger_edge isn't runtime changeable so it doesn't need to be
saved in the vmstate.

> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void latching_switch_realize(DeviceState *dev, Error **errp)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(dev);
> +
> +    /* init a input io */
> +    qdev_init_gpio_in(dev, input_handler, 1);
> +
> +    /* init a output io */
> +    qdev_init_gpio_out(dev, &(s->output), 1);
> +}
> +
> +static void latching_switch_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "Latching Switch";
> +    dc->vmsd = &vmstate_latching_switch;
> +    dc->reset = latching_switch_reset;
> +    dc->realize = latching_switch_realize;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);

This is definitely not a display device :-)

> +}
> +
> +static void latching_switch_get_state(Object *obj, Visitor *v, const char *name,
> +                                      void *opaque, Error **errp)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(obj);
> +    bool value = s->state;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void latching_switch_set_state(Object *obj, Visitor *v, const char *name,
> +                                      void *opaque, Error **errp)

What's the requirement for being able to set the output state via a
QOM property ?

> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(obj);
> +    bool value;
> +    Error *err = NULL;
> +
> +    visit_type_bool(v, name, &value, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    if (value != s->state) {
> +        toggle_output(s);

This will call qemu_set_irq() on the output, which isn't a valid thing
to do during board creation or in certain stages of reset.

If you need to handle "the board can create a switch which starts off
with its output asserted", that can be done, but it's a little more
complicated (it involves implementing your reset handler as 3-phase-reset).

It looks from patch 3 like your use case in the aspeed board doesn't
require this, so my suggestion would be simply to not implement it:
make the switch always start with the output state being 0.

> +    }
> +}
> +static void latching_switch_get_trigger_edge(Object *obj, Visitor *v,

Missing newline between the two functions.

> +                                             const char *name, void *opaque,
> +                                             Error **errp)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(obj);
> +    int value = s->trigger_edge;
> +    char *p = NULL;
> +
> +    if (value == TRIGGER_EDGE_FALLING) {
> +        p = g_strdup("falling");
> +        visit_type_str(v, name, &p, errp);
> +    } else if (value == TRIGGER_EDGE_RISING) {
> +        p = g_strdup("rising");
> +        visit_type_str(v, name, &p, errp);
> +    } else if (value == TRIGGER_EDGE_BOTH) {
> +        p = g_strdup("both");
> +        visit_type_str(v, name, &p, errp);
> +    } else {
> +        error_setg(errp, "Invalid trigger edge value");
> +    }
> +    g_free(p);
> +}
> +
> +static void latching_switch_set_trigger_edge(Object *obj, Visitor *v,
> +                                             const char *name, void *opaque,
> +                                             Error **errp)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(obj);
> +    char *value;
> +    Error *err = NULL;
> +
> +    visit_type_str(v, name, &value, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    if (strcmp(value, "falling") == 0) {
> +        s->trigger_edge = TRIGGER_EDGE_FALLING;
> +    } else if (strcmp(value, "rising") == 0) {
> +        s->trigger_edge = TRIGGER_EDGE_RISING;
> +    } else if (strcmp(value, "both") == 0) {
> +        s->trigger_edge = TRIGGER_EDGE_BOTH;
> +    } else {
> +        error_setg(errp, "Invalid trigger edge type: %s", value);
> +    }
> +}
> +
> +static void latching_switch_init(Object *obj)
> +{
> +    LatchingSwitchState *s = LATCHING_SWITCH(obj);
> +
> +    s->state = false;
> +    s->trigger_edge = TRIGGER_EDGE_FALLING;
> +
> +    object_property_add(obj, "state", "bool",
> +                        latching_switch_get_state,
> +                        latching_switch_set_state,
> +                        NULL, NULL);
> +    object_property_add(obj, "trigger-edge", "string",
> +                        latching_switch_get_trigger_edge,
> +                        latching_switch_set_trigger_edge,
> +                        NULL, NULL);
> +}
> +
> +static const TypeInfo latching_switch_info = {
> +    .name = TYPE_LATCHING_SWITCH,
> +    .parent = TYPE_DEVICE,

Don't implement new devices as direct child types of TYPE_DEVICE.
At the moment that makes them never get reset. Make it a child
of TYPE_SYS_BUS_DEVICE instead.

> +    .instance_size = sizeof(LatchingSwitchState),
> +    .class_init = latching_switch_class_init,
> +    .instance_init = latching_switch_init,
> +};
> +
> +static void latching_switch_register_types(void)
> +{
> +    type_register_static(&latching_switch_info);
> +}
> +
> +type_init(latching_switch_register_types);
> +
> +LatchingSwitchState *latching_switch_create_simple(Object *parentobj,
> +                                                   bool state,
> +                                                   uint8_t trigger_edge)
> +{
> +    static const char *name = "latching-switch";
> +    DeviceState *dev;
> +
> +    dev = qdev_new(TYPE_LATCHING_SWITCH);
> +
> +    qdev_prop_set_bit(dev, "state", state);
> +
> +    if (trigger_edge == TRIGGER_EDGE_FALLING) {
> +        qdev_prop_set_string(dev, "trigger-edge", "falling");
> +    } else if (trigger_edge == TRIGGER_EDGE_RISING) {
> +        qdev_prop_set_string(dev, "trigger-edge", "rising");
> +    } else if (trigger_edge == TRIGGER_EDGE_BOTH) {
> +        qdev_prop_set_string(dev, "trigger-edge", "both");
> +    } else {
> +        error_report("Invalid trigger edge value");
> +        exit(1);
> +    }
> +
> +    object_property_add_child(parentobj, name, OBJECT(dev));
> +    qdev_realize_and_unref(dev, NULL, &error_fatal);

Current QEMU style doesn't favour providing this sort of
create-and-configure-the-device wrapper function. Instead just
create and set the properties on the device in the board code.

> +
> +    return LATCHING_SWITCH(dev);
> +}

thanks
-- PMM
