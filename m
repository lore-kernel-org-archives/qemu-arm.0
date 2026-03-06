Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0CAF01829
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 11:18:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyTC8-0004H1-FZ; Fri, 06 Mar 2026 06:18:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyTC7-0004Gb-Bf
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:18:11 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyTC4-00078y-QJ
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:18:11 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64c9a6d6b70so7843605d50.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 03:18:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772795887; cv=none;
 d=google.com; s=arc-20240605;
 b=OurxYh9QfVQqCvKkNgMvP96xrbJ4LWpNYhlQd/gMrPvo5I3Xp6+Df9+4mkhfE7dDJS
 pYB07rpfCClxyvTWGO2wCBvy/X999h1V7jS/Sl7A252u1ob5Mqih5Gm9+CZbRXF881KO
 jTeDLoqna1YIX/mnN6hGJuXFDs9zd2xkK1cNWk1a5V52mBV/uQ/0GRngCPMG5AW4YvEf
 28C/ytLuPMgfSqD7pkJzA0Om6O5+GwIFTar3hNPI5gVByHun16ltuE+LAA5hylEaARL5
 EG5YpTDL+ABnOVCOVal6/njJYbEYq3D5GMGDKMaNjNZsaV+t0f3mYwXfXDnG9CMrVAF+
 M3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=L0WoHVrZpBPnhKgVUpIXPIw520ltzzeccYgBNsC3m7A=;
 fh=tLP/gRpi7Iczn5ziGL7f2zBG1RdOSHMz6mExSpHcScY=;
 b=TbFGudxUYvB/IQyInlhKkCafaGkV7bdhFMk4ZFdGjSkoJP2TV/3XcltqZBbh3nd7hf
 MfIyGOJuZfDp1vH6BcNAUdkdINIBor4g1eshtfmB1XzXyc2VW66YuQPBE4JtlXdqkdQL
 TTo0O7849hB91/pQAXUBfmaqDvrbitIQApFkPSl2187PRWFMVcjaDO2EuPHyk900Ok1G
 JwdYPTKU3fWeAbwjhKTEqHdeKsUjN3McunxjKvZHX/QM3TfEwm6T6qfLhbI1v5NJFDu2
 HTkyq70J0HhhE/0J0oNJ3z85phkHp6CPBtNelHvqOsJ3C6mABQ8wfuamNT2HawxgDbEL
 TydA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772795887; x=1773400687; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L0WoHVrZpBPnhKgVUpIXPIw520ltzzeccYgBNsC3m7A=;
 b=xzH7gLWFTUv4OpqFLdsvPZIYm3XJ7X8Z53k7DVox26T/evsxmpXJzdIa8mpP8Xnydx
 SAQ0vD1rgcNJJuLOxge+TNhBr8HjviQ55JFhfDu1iYrHdvuYorgJUEvdZ6V8FjzppBVQ
 L+WAcsZdNIW/pP3WfGaBsh1StB8RaY+ICppd6gH2CEEWBWtmv/d4w0qLxE1Eq/o7qXD4
 QY4vFfNUTp2l/U93o8Cgo/st1L4s+FR3IHyOjjXUjFCB8Kp3ByjbOU3Sjh+MWuHRVpfT
 KVf92miaJhf0dA61/f/weq+gKkFmFMN9WMoPqUg+UiwsJZnvwt5nPq7/EqQIF6yVlkN4
 la1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772795887; x=1773400687;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0WoHVrZpBPnhKgVUpIXPIw520ltzzeccYgBNsC3m7A=;
 b=qk+UBBJhsqKzsyI4IjfUDzMXUEzMD1MhDF3yY4/q2HM3yU7qxT9C4YeZCLbQ7MkqQz
 oeXMb/8g3yfD4fV0dzSNyVdK3VShUq14DVSHErXsMX713sdIX0j9jiQe9B7LYzwgWWaJ
 jq5dRnFpa//J0OHVyLn/zo8x0tKrlmQOplm4nBbnAXSYJjS77MHECKh7aIOtsCsXZAsq
 +sv8vr5rFietKJf2zn8EErCy5giSHx26AxzHukNHhnIjF3v4aSdeqfDkUa1eUHCzjXbx
 KqqC5u7+XAj18RMlh9yoWyadpCoBPROF5qBtlanq9xrPWjzAQGMxNFty42QHmkYaLyhQ
 B6+Q==
X-Gm-Message-State: AOJu0YylMQ8yBmBGugxLhitQP+eycdVLYFouv28BCBanlLT0Kh+grtst
 uHQ6+7a4E35JujFcfh357n+qieJBKpHvq+2fdGsSUekZ+yNGi3TJuGqZNy23wVD+EC5JBIB4r8w
 nu6TIYLvlniFqUA/Sp5JaBSOSA+VWhLp0nfE2O/mOBsoXPfz+y0bg
X-Gm-Gg: ATEYQzzJYH5AuGA0JJQXEmHgYZKveuQHPWzn660/6grJvTGfvDSIIS/cPFt42PmmT3G
 Y7lfNQNbd0K5ljObhkbYyI00xzQDRJWvtxSx0eUqLzN7e9E/FBmsnXERHXK0V4ay94ctgfG+qqt
 zsIuoyOOiQVeYKuvL8PXwiakpvyNDcfXBaJC0B2G+mucxktUqIscCS6ytXAQwS2tqtS41oPV8j/
 owq9yp7ZnxbyBl6x9RHhXUm+DgpD3QJsSHMEQAJAYlA+FZH9DYi4/sjfvuIz8T0iNjlb6s5YYCd
 Pc6pzYBREKGOaDd/xMbUycnhxJEEEgLYHH4wqaRP8h4Dd8K3ASYsHzXeUnrsPaLn3lk=
X-Received: by 2002:a05:690e:4012:b0:64c:9bc9:307f with SMTP id
 956f58d0204a3-64d142c4c22mr1631670d50.42.1772795887386; Fri, 06 Mar 2026
 03:18:07 -0800 (PST)
MIME-Version: 1.0
References: <20260223170212.441276-1-peter.maydell@linaro.org>
 <20260223170212.441276-2-peter.maydell@linaro.org>
 <20260306111106.0000023a@huawei.com>
In-Reply-To: <20260306111106.0000023a@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 11:17:54 +0000
X-Gm-Features: AaiRm502UAUKkhnhn5gz1eS_ZSn9tbnOJWP6HZ4fIlSFajipkMs8F4xt1wXA9-U
Message-ID: <CAFEAcA-LSSryT4VmkbHNaZJhG5_SWVXApom7TEuTADhQRsOCXQ@mail.gmail.com>
Subject: Re: [PATCH 01/65] hw/core: Permit devices to define an array of link
 properties
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 6 Mar 2026 at 11:11, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon, 23 Feb 2026 17:01:08 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > Currently we allow devices to define "link properties" with
> > DEFINE_PROP_LINK(): these are a way to give a device a pointer to
> > another QOM object.  (Under the hood this is done by handing it the
> > canonical QOM path for the object.)
> >
> > We also allow devices to define "array properties" with
> > DEFINE_PROP_ARRAY(): these are a way to give a device a
> > variable-length array of properties.
> >
> > However, there is no way to define an array of link properties.  If
> > you try to do it by passing qdev_prop_link as the arrayprop argument
> > to DEFINE_PROP_ARRAY() you will get a crash because qdev_prop_link
> > does not provide the .set and .get methods in its PropertyInfo
> > struct.
> >
> > This patch implements a new DEFINE_PROP_LINK_ARRAY(). In
> > a device you can use it like this:
> >
> > struct MyDevice {
> >     ...
> >     uint32_t num_cpus;
> >     ARMCPU **cpus;
> > }
> >
> > and in your Property array:
> >     DEFINE_PROP_LINK_ARRAY("cpus", MyDevice, num_cpus, cpus,
> >                            TYPE_ARM_CPU, ARMCPU *),
> >
> > The array property code will fill in s->num_cpus, allocate memory in
> > s->cpus, and populate it with pointers.
> >
> > On the device-creation side you set the property in the same way as
> > the existing array properties, using the new qlist_append_link()
> > function to append to the QList:
> >
> >     QList *cpulist = qlist_new();
> >     for (int i = 0; i < cpus; i++) {
> >         qlist_append_link(cpulist, OBJECT(cpu[i]));
> >     }
> >     qdev_prop_set_array(mydev, "cpus", cpulist);
> >
> > The implementation is mostly in the provision of the .set and
> > .get methods to the qdev_prop_link PropertyInfo struct. The
> > code of these methods parallels the code in
> > object_set_link_property() and object_get_link_property().  We can't
> > completely share the code with those functions because of differences
> > in where we get the information like the target QOM type, but I have
> > pulled out a new function object_resolve_and_typecheck() for the
> > shared "given a QOM path and a type, give me the object or an error"
> > code.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Hi Peter,
>
> Looks good to me, but I'm not confident enough on this stuff to give
> tags.  A couple of trivial things inline.
>
> Jonathan
>
> > ---
> > I want this specifically for the GICv5 interrupt controller device
> > I'm working on.  I'd like to be able to pass in links to the CPUs
> > connected to the GIC, so that we don't have to have the code assume
> > that it's connected to CPU numbers 0,1,2... the way the current
> > GICv3 code does.
> >
> > I think Phil also had a proposed series a while back that wanted
> > to do something similar with one of the existing devices.
> >
> > I figured I'd post this early for review, though obviously it's a
> > little unmotivated until I have my new GICv5 code into enough shape
> > to submit. This is tested, but with my work-in-progress code.
>
> You probably want to update this set of notes given it's in your
> GICv5 set now!

Yes :-)

> > diff --git a/include/qom/object.h b/include/qom/object.h
> > index 26df6137b9..48fdbf353e 100644
> > --- a/include/qom/object.h
> > +++ b/include/qom/object.h
> > @@ -1750,6 +1750,25 @@ ObjectProperty *object_class_property_add_link(ObjectClass *oc,
> >                                              Object *val, Error **errp),
> >                                ObjectPropertyLinkFlags flags);
> >
> > +
> > +/**
> > + * object_resolve_and_typecheck:
> > + * @path: path to look up
> > + * @name: name of property we are resolving for (used only in error messages)
> > + * @target_type: QOM type we expect @path to resolve to
> > + * @errp: error
> > + *
> > + * Look up the object at @path and return it. If it does not have
> > + * the correct type @target_type, return NULL and set @errp.
> > + *
> > + * This is similar to object_resolve_path_type(), but it insists on
> > + * a non-ambiguous path and it produces error messages that are specialised
> > + * to the use case of setting a link property on an object.
> > + */
> > +Object *object_resolve_and_typecheck(const char *path,
> > +                                     const char *name,
> > +                                     const char *target_type, Error **errp);
>
> I'm not sure why you went with this wrapping. I'd combine the first two lines.

Yeah, I'm not sure why it ended up like this either. Sometimes that happens
because I change my mind on the name of a function and don't notice that it
means the wrapping can be done differently, but I have no recollection of
what the process was in this specific case. I agree that putting the first
two arguments on one line is better.

-- PMM

