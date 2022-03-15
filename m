Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2777950lfo;
        Tue, 15 Mar 2022 03:58:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8OE+OMCxcJgoVrhgU4L5bV2oTFvurHHLAafJlOjeqdpHxKUJk4C/IEJYg0tJgZJ7MLhYi
X-Received: by 2002:a05:6402:27ca:b0:418:93fe:da71 with SMTP id c10-20020a05640227ca00b0041893feda71mr5956199ede.409.1647341916324;
        Tue, 15 Mar 2022 03:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647341916; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvYVlAJQvYMrpMIKOnfMsg8roxPxhSLxwXxQOheSb5LfhYwNWVQRQe3k+88Ek7KO65
         u/tbqyWZ1N+YiL15usH21yV6wi4idLIuZSsqJeTxN5gLcrMfir5qClO0wcYJC2FcRfD7
         N5Mpjy0kbQWTGpVYB1Fi+8LT6I45PhUKFE8V+7ylYN4UiI43Mv85FWsQIbjmZxLgfTTP
         YHwVKVxy5/6B7o1Hw1PV7hkvxDQsei81b6zxLolJCG/X+QHaWyPiWGXiyn2Lh/CoONjs
         cIfu7ypIls00K0Ucvb69NVhsQpC43+u0wgZnmqSTfPGAvltK7cIM8KpoVR+phhLYLp1f
         bx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=j4q1mDkTkfU3rhMwSrf7xL1WLfewGHyjSGlrtIXdyt8=;
        b=G1LH2zh5JlJf4z8N0+vT1YkjmaSpr6zZc+J98xPxIXvFTaZLACEtdQ8ENjDJj87j4L
         TS/H7ScS1eXOz9tcolbFtdeIsd+HiByOSFfgdDrr1Mpyvn0uRMLNNZZey9I3+oZzxKqy
         aFzOpdxkkmokrc61Kd/wPwbYursK04a5uyXpv2unoAiVdYs89OHygXCjkiwPWsykr4/S
         c3XxRFdXbUJhKFKJ8d1NKL/muygPzjuv5SzkF0E5vt0i5qfIFUZij89AaDUkfun3dzH3
         U6QMhBPoUlXsZs5tTQte+Nkm1W4xyvz7BZAxIjwisutao41bAYd/kc/7jP0eZtitG8MU
         pu9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T7EDu2xV;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <dgilbert@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i9-20020a0564020f0900b00416b95ab900si8985973eda.87.2022.03.15.03.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Mar 2022 03:58:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgilbert@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T7EDu2xV;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647341915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j4q1mDkTkfU3rhMwSrf7xL1WLfewGHyjSGlrtIXdyt8=;
	b=T7EDu2xV275NETyx7EG9BEbB+wO4fU9kQnmfUAsW5KXsY2bPrdqAMjN80fndtWGiVyVxSp
	Dfi1veKNTP0twdnT3vIPv8kr//a24jtyl8WbM3yDUG4c05PB7asyNU1Kb3GvLM4NYIT7KW
	wsMeecsMTnMUmjaLcPitSUqa8nRoweQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-W92N8VMNPQq1W6kwdlsAXg-1; Tue, 15 Mar 2022 06:58:34 -0400
X-MC-Unique: W92N8VMNPQq1W6kwdlsAXg-1
Received: by mail-wr1-f69.google.com with SMTP id l10-20020a05600012ca00b001f1e4669c98so5144284wrx.23
        for <alex.bennee@linaro.org>; Tue, 15 Mar 2022 03:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j4q1mDkTkfU3rhMwSrf7xL1WLfewGHyjSGlrtIXdyt8=;
        b=mIAWy0bM7T8TgrMSfT3PO3juxZnRvQumzjgWwFAZHhXEqwSd5geC2Ljz5D9RbWZnFr
         bgysE23pHWy1dwMK9bsBJWsfSl0uCCau34u5KLdAWRk57WsOrrEIJFQwrrGcK5DTri7X
         PhJEeUiUAbYt2veq4SHqEpqcUZKpWNkmEhToR6kWz0KwqmyG+RC7n6RJBmte2Y+Wp14+
         CL2r87etsz3dLqJ+AeFdYixTgoJWU0cO/7XA2ujiOqBjcCZHzhgAkIW732T+OaaezIIJ
         4ThSUOSj8nLJaekcA15pXW76DSh9eEGzObOi7Eo3FdNB496Yen+XlEdrN09aHLIbkuBB
         +dXA==
X-Gm-Message-State: AOAM532ZCnRvR4o8hd7dDEFAvaIvA5Iz/z0e70TbHthagbCu+UxU255O
	GHra/neQbq/TV1oZqWaXJojXGl93zlHclnyQkfoYpKD9WsdMufo2ylDIS/y8CsFf5NcOTcskO+5
	w16OKYyTiDDjPERnM
X-Received: by 2002:adf:e704:0:b0:203:750b:3d8 with SMTP id c4-20020adfe704000000b00203750b03d8mr19437734wrm.623.1647341912943;
        Tue, 15 Mar 2022 03:58:32 -0700 (PDT)
X-Received: by 2002:adf:e704:0:b0:203:750b:3d8 with SMTP id c4-20020adfe704000000b00203750b03d8mr19437702wrm.623.1647341912687;
        Tue, 15 Mar 2022 03:58:32 -0700 (PDT)
Return-Path: <dgilbert@redhat.com>
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id l41-20020a05600c1d2900b00389d3e18f8esm2188196wms.26.2022.03.15.03.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 03:58:31 -0700 (PDT)
Date: Tue, 15 Mar 2022 10:58:28 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Corey Minyard <cminyard@mvista.com>,
	Patrick Venture <venture@google.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Colin Xu <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
	qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
	qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Message-ID: <YjBxVFUw2DtBniYS@work-vm>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220314160108.1440470-4-armbru@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: SIsrYwrIEZq5

* Markus Armbruster (armbru@redhat.com) wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This commit only touches allocations with size arguments of the form
> sizeof(T).
> 
> Patch created mechanically with:
> 
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Just a small patch then...

> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index d65e744af9..aace12a787 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -91,7 +91,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>  {
>      int i;
>      int64_t dirty_rate = DirtyStat.dirty_rate;
> -    struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
> +    struct DirtyRateInfo *info = g_new0(DirtyRateInfo, 1);
>      DirtyRateVcpuList *head = NULL, **tail = &head;
>  
>      info->status = CalculatingState;
> @@ -112,7 +112,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>              info->sample_pages = 0;
>              info->has_vcpu_dirty_rate = true;
>              for (i = 0; i < DirtyStat.dirty_ring.nvcpu; i++) {
> -                DirtyRateVcpu *rate = g_malloc0(sizeof(DirtyRateVcpu));
> +                DirtyRateVcpu *rate = g_new0(DirtyRateVcpu, 1);
>                  rate->id = DirtyStat.dirty_ring.rates[i].id;
>                  rate->dirty_rate = DirtyStat.dirty_ring.rates[i].dirty_rate;
>                  QAPI_LIST_APPEND(tail, rate);
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index aba1c88a0c..3a7ae44485 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -43,7 +43,7 @@ struct zlib_data {
>   */
>  static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
>  {
> -    struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
> +    struct zlib_data *z = g_new0(struct zlib_data, 1);
>      z_stream *zs = &z->zs;
>  
>      zs->zalloc = Z_NULL;
> @@ -164,7 +164,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>   */
>  static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
>  {
> -    struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
> +    struct zlib_data *z = g_new0(struct zlib_data, 1);
>      z_stream *zs = &z->zs;
>  
>      p->data = z;
> diff --git a/migration/ram.c b/migration/ram.c
> index 170e522a1f..3532f64ecb 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2059,7 +2059,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
>      }
>  
>      struct RAMSrcPageRequest *new_entry =
> -        g_malloc0(sizeof(struct RAMSrcPageRequest));
> +        g_new0(struct RAMSrcPageRequest, 1);
>      new_entry->rb = ramblock;
>      new_entry->offset = start;
>      new_entry->len = len;

For migration:
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
