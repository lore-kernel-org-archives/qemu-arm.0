Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C956CAC5B5
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 13:50:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3EEG-0002A4-5Q; Mon, 29 Sep 2025 09:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1v3EEB-00024U-SF
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 09:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1v3EDn-0005sP-IV
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 09:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759153625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iHiGRlxUobEpePdY/J4nh0RlNm3a5QbJfQGFAxVfwWM=;
 b=IBnnLNyawFVKFK8nvJ7wTar86gxzAvBYEiWJuFpCvy0w0P7/4UPZ0DeaSPF+hgmufL1+Yt
 3mYE520kigkHrSoL3NQE/spmP00HYhfhtPdBetWVKuuFAD7KUyYQnjUaKiaAb8ysT2kiRM
 31Azg3wBQ/3ZKqWovsBBjf2e8tOMFoY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-LPE-UUQYOHqwqb4M2_rfjw-1; Mon, 29 Sep 2025 09:47:04 -0400
X-MC-Unique: LPE-UUQYOHqwqb4M2_rfjw-1
X-Mimecast-MFC-AGG-ID: LPE-UUQYOHqwqb4M2_rfjw_1759153624
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-79538b281cdso96137526d6.0
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 06:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759153624; x=1759758424;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iHiGRlxUobEpePdY/J4nh0RlNm3a5QbJfQGFAxVfwWM=;
 b=A+czxvWuSRMBAtu6nesDYnr9ylfBZJIVnqqPc7vWvNIcpQiInoIM26VSw1soYrZrQA
 Qx33PMcAD/jcFeVM9WGHZvLg58G9eeHDrIhtSEejuW4wwn0ww8pE8YglG6rmeRwNmOxD
 OufuRM8OxNgb9Iinx5jDy/87zCmsfSrGpw0ugZG60fnLfSbXhymq0hnXZigJdY1N0QRZ
 F22lQ3yWElGXiUHt+UZg4lBxIQiQm3deEzBYbJHGQ/5uJqVWutNwGuggcMwxidkVElSO
 Vky7w7fGt3vHKOzme198Ha7RSiI8bNmFW/AsrKa42vx77f+CYMrEtOfdXjs9jZy3McZk
 YZ+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8vHK5DRsnsktMldm1Gx+FqoOX77dCIlwDbLVfOLTtmRv0mRA/KYzk99hYfMJBdeatFGuD476Log==@nongnu.org
X-Gm-Message-State: AOJu0Yw4lNfF3F0x5KSCCj4Jv21YD1e5bBZhlbJFXH6jm25eeDnyS8uO
 wMXhncCSUGEMLAZYooCUxA0YT+sccDKLji2fI4vUsV1WoVnpYrnIfrz9AjMxY0L3YI0m2y2brnH
 4LxymzRksQXfV4y3IwBzBabk6Z7kb64evNFGblL8SXLMhnDTMOH7mig==
X-Gm-Gg: ASbGncteqdnYs61I89sypGRZsKxtMRPdemxpJdNzXwh10EKSC/49wz5DWObcXCNJoi9
 tjeTs3Q71e/GMf7+UBAvMeyi8wyeFyqqVIymhyW+A0QJWbtbASOpPNXPkU3C4AWdav+4JXmmIO0
 CMbEVrtqbZOakl7gIHBf/PiMAo9zj1DEHr4YeBGUGnMeYDKkHbWPQ5O8Dhh5qDLJs60CA31utU7
 h9MFT3VJVDaWcJBjY++rYbmamQqvGgTatLlsbbClgoM8rp9pG7YwtzoHGanQjMlPf5yCpXEn781
 Us6aY4vpFc+jijMzFEhQCPNczMZpUNRZ
X-Received: by 2002:ad4:5c65:0:b0:70f:abbb:609a with SMTP id
 6a1803df08f44-869a8a9d1cemr9591356d6.19.1759153623989; 
 Mon, 29 Sep 2025 06:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUKonu9l62RbCLN7Em1aPGn94ORFtSDS6viksl+nSCOwrO2CxK9sVW79FG+yGiC7r3b9d9Ug==
X-Received: by 2002:ad4:5c65:0:b0:70f:abbb:609a with SMTP id
 6a1803df08f44-869a8a9d1cemr9589586d6.19.1759153622515; 
 Mon, 29 Sep 2025 06:47:02 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8013cdf32a4sm75795376d6.21.2025.09.29.06.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 06:47:01 -0700 (PDT)
Date: Mon, 29 Sep 2025 09:46:59 -0400
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
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v14 00/27] migration: propagate vTPM errors using Error
 objects
Message-ID: <aNqN05aj0CYttxd6@x1.local>
References: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
 <aNpILAhr8LaMFbcL@armenon-kvm.bengluru.csb>
MIME-Version: 1.0
In-Reply-To: <aNpILAhr8LaMFbcL@armenon-kvm.bengluru.csb>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jv3pHtvYiIVDSrHgnVx77kwSxsyNNHqSUYTXlAISb8E_1759153624
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Mon, Sep 29, 2025 at 02:19:48PM +0530, Arun Menon wrote:
> Hi,
> Gentle ping for the series.
> Is there something more to be done to improve this before queueing it?
> TIA.

Arun, don't worry - I believe this is on Fabiano's radar.

Thanks,

-- 
Peter Xu


