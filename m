Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp163314nji;
        Wed, 11 Sep 2024 06:40:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVPQNJSDGxGFrh61sE/3h0jwHs33tmaMXIaaVEUxol3UJqd93qhm8da06AuZUJ1pYK7jL4EcUL/ttofg==@linaro.org
X-Google-Smtp-Source: AGHT+IGgRlrQUvutdMLkJJzk9GOuvLD4oNNcPPIg5B3WBJtZqCvneSiSi7VSdILlS29lCNhXP8PJ
X-Received: by 2002:a05:622a:1898:b0:458:3eb3:748d with SMTP id d75a77b69052e-4584e9449a8mr48284641cf.54.1726062023729;
        Wed, 11 Sep 2024 06:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726062023; cv=none;
        d=google.com; s=arc-20240605;
        b=apMWrpSb5zXPWEAwdcW3YNMHcAldjW6CMUvznrE7EdpWjGr7h+fOsZVvgeUqEJPLZB
         LC7YcQOcK46TUPEUiaKHj4ujRy1eY4cV+thE9uuV4kNoq9LVorLwgF2QzRYpSf4kJdeL
         Xjyj7rii7JyirLL6UaXg0JcBuGYRGKjjeAYW+dnf92wbYi98INRcFRLy5DANcu8t2oxq
         Fv4vFBswTSiWfyed5r2TGn9NpRSDrZH1+fajF69k36Da4tKuTO6YH5EGStMBEE3kSyF0
         CNE0O7Z5vf0UohEc7W2kyNvjVuToefts8Fi3fxcLasnJOrQLJcuL6PllPOleTAHPN1fy
         amUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ylLQ46RRK0r8akuM+MAjQ7YJk+TYPgJnv3CN/nu5zsE=;
        fh=7M17qeEJZnEjsSXraXLDca0Z21dnhnQMxNCJ/3o9MgA=;
        b=R0nLmnA0hfWiJzXgUuD86e2t2ugVCOObRlcVyW56F2UzoBGIctkXvrmC+YNy4jZDVq
         n/hS787ieA/GhHLGEt39vWOFqB/MpJxM0tHWz04hFpHVqOY+jYjptqmlN1oQ1Byc1kFd
         3q1CRTqfXAIbPjm4e7AJkUVzGvm3hbCQ3jFM6OzwOolt/Ic6xiXUMKfHMMZ+SCWu/dfu
         WIvAY14BN2cDiSIlLS8adQbIo2R5ayVU54jtGD+Q9fKWGSOYrrOQ/IPXPydZR7nan8du
         gEZHhd5QUH47m+NoiFbMo8eKgMoE41DCxEu6eH0KXKJ7bTFNUgKrGMqq9I3Sq8NGQVYI
         bdbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eb0xVDQU;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-45822f8159bsi103267221cf.461.2024.09.11.06.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 06:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eb0xVDQU;
       spf=pass (google.com: domain of peterx@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726062023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ylLQ46RRK0r8akuM+MAjQ7YJk+TYPgJnv3CN/nu5zsE=;
	b=Eb0xVDQUAADQR9BMlNlZjhejsks59Q79UMXRdNE6A/XanvO5XCHRNLS1oIJ+JX2elc8Rv/
	MblkXdbKmIH/GyJEL0FBOZ40zMby/kPtuLykCnNDKvP3un2epEveJsGrpQsNhPHC6+mr+S
	YBjTcvAqLR+6x298G1NkGsIC5BmYnWA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-wHLpXE0FPvOqotJwbYb_SQ-1; Wed, 11 Sep 2024 09:40:22 -0400
X-MC-Unique: wHLpXE0FPvOqotJwbYb_SQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7a9b2b3a2bfso459891085a.1
        for <alex.bennee@linaro.org>; Wed, 11 Sep 2024 06:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726062021; x=1726666821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylLQ46RRK0r8akuM+MAjQ7YJk+TYPgJnv3CN/nu5zsE=;
        b=idcm87T6JSM4FsaoTuiYICCOOp+hygovbJ9W5wyxZM6PMcUxkvR5mmftgmoLzKkbvV
         K2f1dwlFZDqITRTG0HZxkq5vd6m/hBaAgXxup8crLOY3DHZc4xXcKHCAutaagXFzYecd
         3uFwvjhW1/lKes0++Y0wY5Tzbr0hMrkIGsBFB8KM+MLkpEko2/s2df1RNuUurxEqyPBx
         0MfYdnl4sUICdS4zvLuttSglz1P6DBVjACccBZIC3eSpuGZ3Q9C7bmIcO9TXq/0MT3iq
         +WeBWhDtwt/2kHJU1ukG0SpKnvXw8QHGNwYGaztFjzZzusY1Y2Eo77pxgNYfGZeFZHE1
         0ixA==
X-Forwarded-Encrypted: i=1; AJvYcCVEp5X8kjUZJCI2KNGmn+/QMhdeUk1cQ3E2moDxGHnrNJNEjwkbYWng/d5IuVtRNxkFI+xHmCIZympmRA==@linaro.org
X-Gm-Message-State: AOJu0Yx1S3RrnrzrB7F0i7xaFpDV3EWxe+lY32bqZudixWTOU4//Tomg
	ZmjCYVaHOM0j/0Pm/aF0gLeWwGR9AnRf6kPNOJurEgxxrfk+fqxN2cPLJ+5Rc5IxVFLWP+l5uvi
	+o1dxzLDJ09Z83ETI55KsvELcND9DGB3hdFBXYQGSV9PnYUl9t4pvsg==
X-Received: by 2002:a05:620a:2454:b0:7a9:a6a7:dc2e with SMTP id af79cd13be357-7a9d3a7a33emr403694385a.26.1726062021418;
        Wed, 11 Sep 2024 06:40:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2454:b0:7a9:a6a7:dc2e with SMTP id af79cd13be357-7a9d3a7a33emr403689185a.26.1726062020970;
        Wed, 11 Sep 2024 06:40:20 -0700 (PDT)
Return-Path: <peterx@redhat.com>
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7a1a8d5sm421889085a.116.2024.09.11.06.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 06:40:20 -0700 (PDT)
Date: Wed, 11 Sep 2024 09:40:16 -0400
From: Peter Xu <peterx@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>, Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 08/39] migration: replace assert(0) with
 g_assert_not_reached()
Message-ID: <ZuGdwMYENxER2r6-@x1n>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-9-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240910221606.1817478-9-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TUID: FBrfPbZMhObe

On Tue, Sep 10, 2024 at 03:15:35PM -0700, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu
