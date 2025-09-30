Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A359FCCA470
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 16:08:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3ctj-0002nD-Qo; Tue, 30 Sep 2025 12:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1v3ctj-0002mw-3F
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 12:08:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1v3ctf-0007S2-U9
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 12:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759248488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YxI4v0S54bGaDlWElyQOvn9DJw//p8KK1Vc6ksGL5l8=;
 b=J0KPRewDWRvJgCovPtUhiOy9Ba0IZhACZvyrKXUPvAv/AgUShLjkVDQai3CGdBTxM5STWY
 5Qsb/I2dh85Q9E8u++Qh+PTZLOR78yP2SsnwMsx8vlfG8gk7j8ayQJ4U/W2ovnhws6oF3d
 BqBXsuJvJ4+l1riA7D8pYQe862ywDzo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-kDX3v8G6ONGBs4dnmOZ1Qg-1; Tue, 30 Sep 2025 12:08:06 -0400
X-MC-Unique: kDX3v8G6ONGBs4dnmOZ1Qg-1
X-Mimecast-MFC-AGG-ID: kDX3v8G6ONGBs4dnmOZ1Qg_1759248486
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4df7cdf22cbso1097301cf.0
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 09:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759248486; x=1759853286;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YxI4v0S54bGaDlWElyQOvn9DJw//p8KK1Vc6ksGL5l8=;
 b=qVmXXx0EI6DQPcqp1Pqm2yEt5uezxIfNSyxCOzv1LC+jtr4fVaLFegVtNIFSS4YfVB
 eYrdFdGQ5bbPP6r8clyjsQ3b1rj7/k1CT+0fw8a+Z5sZd+hEcFW78/WfNCYQM6KteBHG
 l7t+MIFgCoV4+O9Rf4zyquxizygozLvKThmn/f1drf99vNrRXMTi2S2/CHEok1EibY3r
 /MYHd6+7PJA/EqA7ncabrkmNRkNGiUFxVi059uL+J0dmtPSrevzqmLSNJRb6tzf0OSfb
 HnsNg6hyWIrLifmEShvrUqG5iTg7jVDAzqhTLFDPEZM6UVwp42hAPfomW81jRZdFTpYc
 5sgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7x6WC5r7Ax1jyTDqZtZuPsvldfME6dCYDEFXWAEaA9qF7v8A8IMabWmp3GKdlMeE8Mj+W3lqS1w==@nongnu.org
X-Gm-Message-State: AOJu0YxnU+1Gwa+fBiaI88KTqrdz8g/KChjXkxVGxHb20W5SmfuSLhj+
 a/9N9CQzBNfNEwrotX5PHK2AMGlA9hONQ/rI18ATkQx2kS+tECGjrAyKV3WZQj91X0cQGJqzcd/
 2z+qn3cww1RSz5EIeBQ7R2g1B9w1opfFeqf0pEa6hVK1R20vCgn38Zw==
X-Gm-Gg: ASbGncuTew42aQaIA5QJNkE0xMwM0Ii/waNORMyfjZkwYQywsmsT4KeZE3143hokmEz
 LfChzbhSB3crn0ryrZQ7V5tPd2kbstXpmNYJb5SkStjz8OvJLuvbQcPUIKaOAQFeosbo4Na6aEP
 oZv3YxdwN6L/8gQblluwXaVx2+sWtpVQuftG12zvEdh2cRAPSwrgLiyzj5juapT8yYf4Hcaxt+3
 XzImIhbEAB+o8DhFAw9xgmyOkvSJCmDRvbq9SOeBQ2rCYw1FxJZgYdPVkSTaoPfNirAwHI5njjr
 8Joex8xTao1x15uRNNhncx6swH61wCEDOhCW5g==
X-Received: by 2002:ac8:5a54:0:b0:4d1:c31e:1cc8 with SMTP id
 d75a77b69052e-4e4062fc56emr6141281cf.22.1759248485790; 
 Tue, 30 Sep 2025 09:08:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8P3iFCd8fq4YjdI8dNQ3QDSGh35v348iten2iebzSOxID+4CduLfDNANsP+qBfQsovSz2vg==
X-Received: by 2002:ac8:5a54:0:b0:4d1:c31e:1cc8 with SMTP id
 d75a77b69052e-4e4062fc56emr6140461cf.22.1759248484997; 
 Tue, 30 Sep 2025 09:08:04 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4db11ae8d47sm99072571cf.44.2025.09.30.09.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 09:08:04 -0700 (PDT)
Date: Tue, 30 Sep 2025 12:08:02 -0400
From: Peter Xu <peterx@redhat.com>
To: Arun Menon <armenon@redhat.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v14 25/27] migration: Rename post_save() to
 cleanup_save() and make it void
Message-ID: <aNwAYqCPfDaYOqv8@x1.local>
References: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
 <20250918-propagate_tpm_error-v14-25-36f11a6fb9d3@redhat.com>
 <aNrVBYf4FP82ZTha@x1.local>
 <aNtcxyvGLYVRhbuk@armenon-kvm.bengluru.csb>
MIME-Version: 1.0
In-Reply-To: <aNtcxyvGLYVRhbuk@armenon-kvm.bengluru.csb>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OJ5RxndpPCAyL4WJfwr3WQwLplq434tTRSRTHYLiZVk_1759248486
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Sep 30, 2025 at 09:59:59AM +0530, Arun Menon wrote:
> Thank you for the review. I see it now.
> I used the --enable-rust flag to change my configuration.
> I have removed the patch and resent the series (v15)

Next time feel free to avoid the repost. I've managed the rebase which is
trivial.  I'll explicitly ask for a repost if help needed.

Thanks,

-- 
Peter Xu


