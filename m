Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E18D34082
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 15:35:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkl5b-0006sV-EI; Tue, 27 Jan 2026 10:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vkl5Z-0006qe-QW
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 10:34:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vkl5Y-0000uB-0I
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 10:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769528082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B+h/xeHx3zq+tYCayALJUIBKHw9jpZUo3+hHA5tJU44=;
 b=KjPhkiNcC3htmEdJweIq3lgeDx/X8j8m1hZfXJn3e3IOWI9VmP37xLr01KeF7I4AriwYLG
 ozXw1jYk/M1pawhEpURCl1MNNdDlAxOiDj7NbrRt2ClMxh/b1v3RhErBwl5myVx1RZKb3m
 NF/q91etOeknyt8ligubbfoVsZRWF7w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-sAd2QWUpPASDi95VZvx2iQ-1; Tue, 27 Jan 2026 10:34:40 -0500
X-MC-Unique: sAd2QWUpPASDi95VZvx2iQ-1
X-Mimecast-MFC-AGG-ID: sAd2QWUpPASDi95VZvx2iQ_1769528079
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-430fe16b481so4417286f8f.3
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 07:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769528079; x=1770132879;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B+h/xeHx3zq+tYCayALJUIBKHw9jpZUo3+hHA5tJU44=;
 b=ReNxC5ss9QNRQvkruChM0LnvbJZbBcRbfrsuaHOkmh92RuJ5+Q37vbkLb+nSpbG+yd
 ZeOEthBuiirlzAXBYxDYQBkn/xua3j/QPlyMoQx7xI7rUatv8h1dH82GgkxpE+EV4ddf
 dJ0kw/b6kXODcuaRTr52sd1qE0Mpu2RaNDhGKLxbeIxrT45ayFCx7iEQPw92YYDGW4EV
 F1o3V32ba9IBNjoZyjXgkimDwTTkomsMJk5a/tdC6ClFGwxjMerlVlvRJ7zKlQvUIL2B
 kZULSbhBOl/k7N8olU03FIINpYATNB6ii8XsVnDx4QRQ5qsDqvFZ7rJbON0Y6yF+11rB
 N/lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbDqLT/wFeCl+csg0hNvGhX5M4w57NzKTX3XxWdB5iAhOW7jzLbOivCqnUBDTKN357gXSMOPojJg==@nongnu.org
X-Gm-Message-State: AOJu0YwUPGNfvSnwPjx3c40DH6kyQ9O00KSRHI64e863UIEXAD+jtxNU
 rROX7PZClHSa/Donu9L/IjebyAwHZr/AnsqhJa+mmubjf1O/KLduIti5etxm0YWGjTfmnFu3sCF
 YRdc2+ouLN31c5S4wYrYtEPb4oLicce0G0ZL0Clyup4osgGVBQYuloA==
X-Gm-Gg: AZuq6aJcIONF4htAiiU00zXRBXsWwJ14vuclCgXSXK47pCZPqpaNRL49BGLsXZo3kw5
 0g2ERj3e5NZFqJEk8lK0HI8fY+sJRZRY9+CsLq5IhgeMIuGLBWTNnHrpQxQE5+eMXeXClhshrHq
 WDZz/dV68EbeZWXp6eQ21QoLa4hmBA28fEzL7Sx9uu/otOwfogsivB4oQ9A+srOJ3Eu9slQVA00
 Jjod+RC6kLs3Y/xeFwK5aCpFcLok0RbHiV22rWSx8p0zSwODBj5/GHIotLi45VC/7AV58gFzATF
 QaxAQ4g0XKH6SQf91tDJGwDzPO+iqLozEEzpVQzCUkCnAVg5nXb/h9Yx95RoGZsq0P2M6U0YT4T
 KHXl+4obm0/DN0RSsvkqtOVpH3hf9Uey16EL0
X-Received: by 2002:a05:6000:248a:b0:435:db94:d81f with SMTP id
 ffacd0b85a97d-435dd1c3c72mr3201137f8f.47.1769528078682; 
 Tue, 27 Jan 2026 07:34:38 -0800 (PST)
X-Received: by 2002:a05:6000:248a:b0:435:db94:d81f with SMTP id
 ffacd0b85a97d-435dd1c3c72mr3201080f8f.47.1769528078101; 
 Tue, 27 Jan 2026 07:34:38 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c02f71sm38879847f8f.6.2026.01.27.07.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 07:34:37 -0800 (PST)
Date: Tue, 27 Jan 2026 10:34:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 Igor Mammedov <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Ani Sinha <anisinha@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v17 03/21] hw: arm: virt: rework MSI-X configuration
Message-ID: <20260127102534-mutt-send-email-mst@kernel.org>
References: <20260121134114.9781-1-mohamed@unpredictable.fr>
 <20260121134114.9781-4-mohamed@unpredictable.fr>
 <CAFEAcA-GL9UG5MN5tKDzLwQ04cBGa99cSau4=2BLTs0+GGSdJw@mail.gmail.com>
 <51E78FA9-2C66-4E8E-947F-F009A8AEEDFD@unpredictable.fr>
 <CAFEAcA_7o-dNFUgMo=UdYD_cf=dwbMCy6b+_2SRSxVbDmmAUmw@mail.gmail.com>
 <9ECB5E0B-3BD3-47D3-9E6B-204A354CEA84@unpredictable.fr>
 <CAFEAcA_g3VfRectVpUG-OnLh_AtsqpLt7YYrYXDSfiesS5EuKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_g3VfRectVpUG-OnLh_AtsqpLt7YYrYXDSfiesS5EuKw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XEMnhTX4wh5u-e-thilQP69lklRXCMV6bonc60j3Td0_1769528079
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Tue, Jan 27, 2026 at 02:10:08PM +0000, Peter Maydell wrote:
> On Tue, 27 Jan 2026 at 13:40, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> >
> >
> >
> > > On 27. Jan 2026, at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Tue, 27 Jan 2026 at 12:46, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> > >>> On 27. Jan 2026, at 11:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >>>
> > >>> On Wed, 21 Jan 2026 at 13:41, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> > >>>> +/*
> > >>>> + * In the prior Qemu ACPI table handling, GICv2 configurations
> > >>>> + * had vms->its=1... That's broken.
> > >>>> + *
> > >>>> + * Match that assumption to match the existing ACPI tables that
> > >>>> + * have been shipping for quite a while.
> > >>>> + */
> > >>>> +static int is_gicv2_acpi_workaround_needed(VirtMachineState *vms) {
> > >>>> +    return vms->gic_version == 2;
> > >>>> +}
> > >>>
> > >>> We don't need to keep identical bug-for-bug ACPI tables like that.
> > >>> If we were incorrectly reporting an ITS in a GICv2-only ACPI table,
> > >>> that was a bug and we can fix it. (This might need adjusting of the
> > >>> golden reference ACPI data in some of the bios-tables-tests if we
> > >>> were testing that, so it ought to go in its own patch.)
> > >>>
> > >> Hello,
> > >>
> > >> I’m a bit concerned about breaking hibernation in this case…
> > >>
> > >> My intent was keeping this behavior for now and then add a machine model version dependent toggle in a follow-up patch.
> > >
> > > I'm not an ACPI table expert but my understanding is that it's
> > > OK to change the ACPI table contents without having to make
> > > those changes machine-version dependent. See e.g. commit d6afe18b7242,
> > > which changed the ACPI tables for the its=off case and did not
> > > make those changes machine-version specific.
> 
> > That commit didn’t affect the default/regular config so it wouldn't have been too problematic in practice.
> >
> > Have had countless issues with how brittle hibernation is* - and more or less subtle ACPI table changes
> > tend to break it.
> 
> I don't want to add back-compat handling for this to the virt
> board unless one of our ACPI table experts says that yes we
> do need to keep the ACPI table contents identical for older
> versioned machine types.
> 
> thanks
> -- PMM


Generally what we have handles VM migration, not hybernation.  The issue
with hybernation is guests might cache some data to speed up init. If
you want to go overboard you would have to never change anything at all
in the firmware.  Whether they do it in any specific instance is hard to
predict 100% but our approach generally is to try with a couple of
popular guests, and not to worry too much ahead of time otherwise.  For
several reasons: one is most changes are harmless, another one there's
no special race here, if there's an issue you can trigger it
predictably, yet another one is hybernation is a rarely used feature.

For the specific change, I'd guess just test and if fine - fix it without a compat.

-- 
MST


