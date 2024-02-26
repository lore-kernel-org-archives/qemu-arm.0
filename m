Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2140028ejf;
        Mon, 26 Feb 2024 07:53:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqtw514or3dDmqEbz6q4C5lZ3hKRvj/sWA8yh5tnMXam8o0YMNGhrlF9ZsESG54oJMJkSnckbl6ARuO9VP4fQ39tou7VIf
X-Google-Smtp-Source: AGHT+IG3Rk88Z4i+II/d2Wyd+JZJtZ+mmLO3FI79SMK7ZLdbd2kITXYN5YqoUpajhJTzimLy+p4i
X-Received: by 2002:a05:620a:5645:b0:787:90a4:7694 with SMTP id vw5-20020a05620a564500b0078790a47694mr8348296qkn.61.1708962805543;
        Mon, 26 Feb 2024 07:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708962805; cv=none;
        d=google.com; s=arc-20160816;
        b=X8QcWeRTTbsm5dZcKl9wua/qkNCkTKODa0T0PMdsdOB+vFitSQjZM3eP8iOe9+Wo2D
         gR9xGDbHg1APAmg6Av4EUX/m94R9ATkfDUC/++KG8Tp6uwUs8gaSaIsakJ7amPv2Ioj/
         v9UPTjKGfg1XMzOt9mhDzU55mRFbaKepFZF3WcbmB6uB8+sSyVAYU9GFPyrMqva4FmWd
         Y2vZOrsuUByc6MFnd0hlas/tPOn0jpnUBEBkKyI1vd9oIgrezSib5CCITk+b080kVFes
         7e8iYBWpE3dpQtMcK2t9QV4LESiuFfHUY+uVnq1AKJhXQm6eBlIau+adha/uiyx4Feps
         sy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=JoGHBVhrF2k2h1YyWAFWxo34csvXgz7vGuhIvApF1Fk=;
        fh=37J9MutlcBgsQwZkIUG4fQHW+H9Zl6PxtJqQRC0HTfQ=;
        b=TtLmUZdjQjft5ixQE0ZrZjDmry0vWKv/7UevJ5ODGS5iWI5Ka6fGQQpQuxg6eZbsi7
         0CjWMEIGpJVmlut7zeQ2nbUnRaSEt3kf7aRnAnBWmdEiCiZnw+KqF6jW+wUdBfT89ljP
         hB88vk6KDqxHpnMtKUoi+5xHywdWruiS7osBf4Q6vT+kMU7RZ+EeO2P0UKx2am9zHE8M
         yc3PSnR4ODs+0I45U/X6Ijm/9ZKi7qxvzaxDcUEASmjLJmh+JOikKC2S9Y8jQiIN6RoP
         QVz/Sexr5W0/Rr3HC7UdZxXDNH59Qavn5XHGHDw+PwPPM41U3DyYx+Vljwim0GhOH3IF
         T1JA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05620a038e00b0078753bb0d36si5300726qkm.602.2024.02.26.07.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 07:53:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redHn-0008QI-6p; Mon, 26 Feb 2024 10:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1redHk-0008Pe-Th; Mon, 26 Feb 2024 10:52:56 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1redHi-0003ao-Kr; Mon, 26 Feb 2024 10:52:56 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tk4lJ73chz6JBTb;
 Mon, 26 Feb 2024 23:48:12 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 046D0140A9C;
 Mon, 26 Feb 2024 23:52:47 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 26 Feb
 2024 15:52:46 +0000
Date: Mon, 26 Feb 2024 15:52:45 +0000
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: Markus Armbruster <armbru@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, "=?ISO-8859-1?Q?C=E9dric?= Le
 Goater" <clg@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <qemu-trivial@nongnu.org>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH 1/6] hw/cxl/cxl-host: Fix missing ERRP_GUARD() in
 cxl_fixed_memory_window_config()
Message-ID: <20240226155245.00004a88@Huawei.com>
In-Reply-To: <ZdYQ99m6BXzxb+nf@intel.com>
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
 <20240221094317.994454-2-zhao1.liu@linux.intel.com>
 <878r3evyth.fsf@pond.sub.org> <ZdYQ99m6BXzxb+nf@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HAXKL/riRHvu

On Wed, 21 Feb 2024 23:04:23 +0800
Zhao Liu <zhao1.liu@linux.intel.com> wrote:

> On Wed, Feb 21, 2024 at 12:31:06PM +0100, Markus Armbruster wrote:
> > Date: Wed, 21 Feb 2024 12:31:06 +0100
> > From: Markus Armbruster <armbru@redhat.com>
> > Subject: Re: [PATCH 1/6] hw/cxl/cxl-host: Fix missing ERRP_GUARD() in
> >  cxl_fixed_memory_window_config()
> > 
> > Zhao Liu <zhao1.liu@linux.intel.com> writes:
> >   
> > > From: Zhao Liu <zhao1.liu@intel.com>
> > >
> > > As the comment in qapi/error, dereferencing @errp requires
> > > ERRP_GUARD():
> > >
> > > * = Why, when and how to use ERRP_GUARD() =
> > > *
> > > * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> > > * - It must not be dereferenced, because it may be null.
> > > * - It should not be passed to error_prepend() or
> > > *   error_append_hint(), because that doesn't work with &error_fatal.
> > > * ERRP_GUARD() lifts these restrictions.
> > > *
> > > * To use ERRP_GUARD(), add it right at the beginning of the function.
> > > * @errp can then be used without worrying about the argument being
> > > * NULL or &error_fatal.
> > > *
> > > * Using it when it's not needed is safe, but please avoid cluttering
> > > * the source with useless code.
> > >
> > > Currently, since machine_set_cfmw() - the caller of
> > > cxl_fixed_memory_window_config() - doesn't get the NULL errp parameter
> > > as the "set" method of object property, cxl_fixed_memory_window_config()
> > > doesn't trigger the dereference issue.
> > >
> > > To follow the requirement of errp, add missing ERRP_GUARD() in
> > > cxl_fixed_memory_window_config().
> > >
> > > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > > ---
> > > Suggested by credit:
> > >  Markus: Referred his explanation about ERRP_GUARD().
> > > ---
> > >  hw/cxl/cxl-host.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
> > > index 2aa776c79c74..c5f5fcfd64d0 100644
> > > --- a/hw/cxl/cxl-host.c
> > > +++ b/hw/cxl/cxl-host.c
> > > @@ -26,6 +26,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
> > >                                             CXLFixedMemoryWindowOptions *object,
> > >                                             Error **errp)
> > >  {
> > > +    ERRP_GUARD();
> > >      g_autofree CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
> > >      strList *target;
> > >      int i;  
> > 
> > The dereferences are
> > 
> >        fw->enc_int_ways = cxl_interleave_ways_enc(fw->num_targets, errp);
> >        if (*errp) {
> >            return;
> >        }
> > 
> > and
> > 
> >            fw->enc_int_gran =
> >                cxl_interleave_granularity_enc(object->interleave_granularity,
> >                                               errp);
> >            if (*errp) {
> >                return;
> >            }
> > 
> > We check *errp, because neither function returns a suitable error code.
> > 
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> >  
> 
> Thanks! I'll attach your description to the commit message.
Thanks for the explanation in the commit message and to Markus for
the cases it affected.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> Regards,
> Zhao
> 

