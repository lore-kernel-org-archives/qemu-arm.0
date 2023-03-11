Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp913076ejc;
        Sat, 11 Mar 2023 11:28:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/D8laaCferM1I9lbo9zGQCnw14CCFvSj47aQydqeyQBCg63ruwmI1QZD/cs01/dMnSnE1Y
X-Received: by 2002:ac8:7f4d:0:b0:3b9:a441:37f4 with SMTP id g13-20020ac87f4d000000b003b9a44137f4mr49247808qtk.52.1678562905887;
        Sat, 11 Mar 2023 11:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678562905; cv=none;
        d=google.com; s=arc-20160816;
        b=gGlKnMNSM9iQ8+dk2Cxj8gMAd3vjtaWlg4wUaID3IswzAf3yFP4oBJ3xWI9VaAqsnP
         O7yP8vNIUfx11tt8lztleoWgZLtLISTst0cTm6agk1LveE8lwwtY+9WCixmsVbqOKx8w
         Fac0wG5gRYHb1E/zWdISY5jIiTAUpgX2/C0ZsFW0OZWiy6i+3qqlpV/43vcNK0QKlPN6
         EIqxlLhLNqwhA1uWfLhPrecPoIRArTlfgNkf4f1KGzzb75ahD29MavLQ04A7XeJvZwRi
         pQtUpz97DwT+lG3WiIY4F8UjRJcOTny6X8gVz509G420nPN67S5Imlh/y6LmXG9GOE+x
         Gmxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Z7XHoCGtuSnMa/aJBKnvHHObzRB44rWPBs6WD3Kn4vM=;
        b=VSkPWXTAA7mNLmzqnM+skK5RXS2WnADk1D1BziXX0+DinLfTp3rN65MZ2WWf++Ave7
         PqKoM5MT25WTrPgzMkzWWLn9FByfVwBNw284hS6XklQBSgSSd1AVtNOV0SUlceashTl9
         aBmuBFXosdbTT6K29zpaAKLGAhHkuyYySZrEoWVPgjDA0IB1rgl+wvu+7DBlnZgzXpHb
         heltd60IRqxZYNT81++rhHBee1myQ0jk2psEFLh3KZwza8O6YxlDO6mHgEJriC9B2+I1
         /dk8ogVX4sxqDlES4ic4U6wCDBpAF9bxP9i82VvQN2S/i0EiyjZJzfI3r1rChK5ere6N
         PKwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GMU+GY2p;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id c4-20020ac87dc4000000b003bd1bc1038dsi2139725qte.751.2023.03.11.11.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 11:28:25 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GMU+GY2p;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678562905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7XHoCGtuSnMa/aJBKnvHHObzRB44rWPBs6WD3Kn4vM=;
	b=GMU+GY2puURLp3tD89/mzG5HD86FlmZ5nEdmUJpmIzGoxslMyncll89yTOrSxCe9JvCq79
	0rfxT1VWBnrM3a0/5nrlDliYml1J2Ssu5t7huo4o67Y+K6JGGi0fiDUnPaERfv1vbEBKuq
	v0Ypf+H7zcFEuLdkFge3eM8fcyPjbzw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-skOWol_KPyeu7sSjU8CsfA-1; Sat, 11 Mar 2023 14:28:24 -0500
X-MC-Unique: skOWol_KPyeu7sSjU8CsfA-1
Received: by mail-wm1-f71.google.com with SMTP id p22-20020a7bcc96000000b003e2036a1516so5501288wma.7
        for <alex.bennee@linaro.org>; Sat, 11 Mar 2023 11:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678562903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7XHoCGtuSnMa/aJBKnvHHObzRB44rWPBs6WD3Kn4vM=;
        b=mQrriPY/V1KXahk4ROGbMQnBY4S9ivaMk3pSFYywfAhXmuA4vBVydq9ECFL5bWXKYr
         uqyLNvBK2Ctt6tsxqCxs0R58QPQ1vnj5331UtF1YwE5hMx3htr1n82zIML46+LIsPGle
         n+3vrT4Sxm/zuRa10cgqjuVbx+92JouGIZldmB8T0RCEH34yTsNOIfD9GSdhDn9mxJgF
         Q1rPiBh/vxctdXwQNlBCgEBvClCRFGCzAkB1ghjyC2rG8gn/PP72wDwTgDoBWgI82M/m
         EAQZP6aRrqcx2S6QaPxh90hXyzl9KSH3ITWBYPiHmjyqaaAdBuFotQWt7F55KIt29hBL
         X0Ow==
X-Gm-Message-State: AO0yUKXddG/KQlG8RcDSWVEqId2zoBSi39CWPnZdkikOGwJ5rmo5Q4TL
	atWHfbZ0he9sC9bNCFmLJbYf1rm0JJLYHmI3/P9UcfvrFumGNoEgV0o4BOx9MFEAYrxk9P7tJ+D
	VNzIU4PnK6gOB2za/
X-Received: by 2002:adf:f58b:0:b0:2cc:4dac:fe3e with SMTP id f11-20020adff58b000000b002cc4dacfe3emr20331965wro.62.1678562903212;
        Sat, 11 Mar 2023 11:28:23 -0800 (PST)
X-Received: by 2002:adf:f58b:0:b0:2cc:4dac:fe3e with SMTP id f11-20020adff58b000000b002cc4dacfe3emr20331961wro.62.1678562902926;
        Sat, 11 Mar 2023 11:28:22 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.29.35])
        by smtp.gmail.com with ESMTPSA id o15-20020a5d4a8f000000b002c70e60abd4sm3164093wrq.2.2023.03.11.11.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 11:28:22 -0800 (PST)
Date: Sat, 11 Mar 2023 14:28:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
Message-ID: <20230311142752-mutt-send-email-mst@kernel.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050853-mutt-send-email-mst@kernel.org>
 <87edpweo4q.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87edpweo4q.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: xKc0vbWfmrQI

On Fri, Mar 10, 2023 at 10:23:33AM -0300, Fabiano Rosas wrote:
> > How about a special make check target that will just test
> > xen things?
> >
> 
> Probably overkill for this particular issue. I don't see any
> Xen-specific tests yet. It would run almost the same set of tests.

Well, a subset for now.

-- 
MST
