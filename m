Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1945458ejc;
        Tue, 12 Mar 2024 09:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrUS1DkBU9ICcPc+edi1THRCfabZ8bzWvvY218wBqa0upuf8lm48gzQ1KP4LirIlitJnAADMgyOzgc/ifzlWFTlztRPQd4
X-Google-Smtp-Source: AGHT+IFobRPlI4bVG5BtuV3Ve4/6Tq3pnfJx5FBq9F2licNqAqalajbYYvHnnnj/ce6KLCdFypXx
X-Received: by 2002:a05:622a:244:b0:42f:20b6:4866 with SMTP id c4-20020a05622a024400b0042f20b64866mr12342335qtx.17.1710261880123;
        Tue, 12 Mar 2024 09:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710261880; cv=none;
        d=google.com; s=arc-20160816;
        b=Ok/vKinReHkV2JHOhNt6m4UwooADZf3mRT1bkxpGcYnX4JFKU7LlROk8XF6c8VaGDq
         jmFfk6v8g1oLFjpilmzvKVsVm3qCNqKDnydfvxK7hpdWy7LHRcJ+PsRMmH/X6fqUJh74
         2rpGjWNqsp0YbSXBjKaRtU7FS4i0PxSU9CVN/xJF9mnDogjcfdTN0rpOyAR7HJSAed9N
         ilZrAuOoQ3wMBFv/iWI44Fe9gQaEa30xPlm66nqVqir4wjtCSVhrrEp8BMliERUxeM/p
         IPViRnA2OpV/l0wSTJDFHInfP084mDJsdfJ91mE/0vsT2/8OC0M6uGCAwOqxhFIYmmkb
         BUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=NFZpIIaHFLHWQ3CKSA+QU16wLiPBEnVumhahukR4YQk=;
        fh=w1UW12MccwC7FVeVdLVwLC0ifkv8jnqp86uFXFbqJq8=;
        b=MYW3jL3yW16lFwQgi8yPr1+l0Ukc2/+CrOvRULS0D1CdHw1eCJYcBe2+5RWB5J9trN
         KMOQQOiJv6Puxm+JE+OwjszYuaCReiYn+rn2GQtNHAtDgiTE5+fkA6I1dImjJAEwZV74
         qNOweGcseY117Ih51OMzhCOd5ie+QS7m8rXF8jZa0uz1Mb1KIv2lpoNNQWzPCmsCqz4+
         6aFI0/pJVB6lLz3+4gFkJdTrCTNs64jcnSeJP4qHqv4Z7fAptHhiGaN5f4Sjry4v1DlO
         jUpJREx2RfiZYdM78gUGapxnvJLIT7N+9Tewa6RjK7KP3IWVubjgSCtyrQQh8LXadQLN
         EAlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NgFnwMJB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020a05622a038800b0042eeb367b8dsi8085757qtx.486.2024.03.12.09.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 09:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NgFnwMJB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rk5EW-0003X2-Fh; Tue, 12 Mar 2024 12:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rk5EU-0003Sz-Lg
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 12:44:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rk5ET-0004mL-Cv
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 12:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710261844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NFZpIIaHFLHWQ3CKSA+QU16wLiPBEnVumhahukR4YQk=;
 b=NgFnwMJBm7vARZDT08/2rsr/6U5BthumxU0Rbxt3171xENIHur0UyVn5cHgFSoKRqFSIkK
 5Mo+kfki3YbZzpN44zwAiqhJdt7JyoAbqXPpphq43BsNMLmX+GokCG7RMT+L5YMx2+oxnm
 T8Oh5lcF1sxqbbhvV2avd93DUxEHcjY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-U13ZUvLjNEeGHdPRX842oQ-1; Tue, 12 Mar 2024 12:44:03 -0400
X-MC-Unique: U13ZUvLjNEeGHdPRX842oQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-41330261f8cso864605e9.0
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 09:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710261842; x=1710866642;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFZpIIaHFLHWQ3CKSA+QU16wLiPBEnVumhahukR4YQk=;
 b=d7yq/AYPz3GHxcnqO928LBqyxXb36L7IaJY2Tk5CYYnCBf+Oc184GeoW+++1s8HGSq
 LqxC6t9/7QDJzRwuj+I6d/t+XmHMjZBccg7P2u36MeaiYN2JQs94fUpbNeyEK9x3H1vR
 hNzbcZrezcad3RqXS35kjCjdAD1R6Cv44AunaR+IJBNf7V0REmXJHYVT5dGwNW+lrpDo
 dTmTeTl1HP94ZMp53TvR8rM1KqQwJmZ+wrcBPHTw0+jlw7a+IJEtggGBSoqGcPbHbSRZ
 TPDZPK51MI4OBRhB55rzF3pwTjRFXi9ZJjwIpYaGW6CqpCtpFlyk78yYAVZokc36IUFA
 sncQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIHQFlOXG4A/apybK/bqWKQuBIIaXK+I1Ro9Py/mDmlWI10n1Ce3XEx4QZa9DduNHEFUrzZ1jw5PFMyhKLHXIlKlLh
X-Gm-Message-State: AOJu0Ywl0DST57dCDXaR3Q/oMfiEuenjNwd5f7Jgar3KlW4Hryx4apMp
 yH+c4CKtkJHoUnHRfQZNv1pcMFefgBICor5MP4nut2D0PMMWM2LpNmZKZEtDiY+7FAgtPzG9oDs
 vIs0mp3GzxVXaBJFkgQZHd53EjkaQ5gyL28Mtayq+MRzIHohFAQ==
X-Received: by 2002:a05:600c:35cc:b0:412:ed3f:1b4b with SMTP id
 r12-20020a05600c35cc00b00412ed3f1b4bmr3005409wmq.11.1710261842189; 
 Tue, 12 Mar 2024 09:44:02 -0700 (PDT)
X-Received: by 2002:a05:600c:35cc:b0:412:ed3f:1b4b with SMTP id
 r12-20020a05600c35cc00b00412ed3f1b4bmr3005387wmq.11.1710261841695; 
 Tue, 12 Mar 2024 09:44:01 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f0:532c:5ae4:fce6:76e1:fa1a])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a05600c3d1900b004133365bbc6sm2840627wmb.19.2024.03.12.09.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 09:44:01 -0700 (PDT)
Date: Tue, 12 Mar 2024 12:43:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2 0/7] Cleanup and fix @errp dereference
Message-ID: <20240312124339-mutt-send-email-mst@kernel.org>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
 <Ze5/r5EW9YsqVwtS@intel.com>
MIME-Version: 1.0
In-Reply-To: <Ze5/r5EW9YsqVwtS@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N+oZLon5sAkJ

On Mon, Mar 11, 2024 at 11:51:11AM +0800, Zhao Liu wrote:
> Hi Michael & Philippe,
> 
> Could this series catch the last train of next releases? ;-)
> 
> Thanks,
> Zhao

yes it will be in subject to last minute testing.

