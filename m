Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92EFC5AC80
	for <qemu-arm@archiver.kernel.org>; Sun,  9 Aug 2026 13:06:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wt3EG-0000iv-KN; Sun, 09 Aug 2026 09:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wt3EF-0000ib-4N
 for qemu-arm@nongnu.org; Sun, 09 Aug 2026 09:06:15 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wt3ED-000055-6I
 for qemu-arm@nongnu.org; Sun, 09 Aug 2026 09:06:14 -0400
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-8ff20870ac7so5929056d6.1
 for <qemu-arm@nongnu.org>; Sun, 09 Aug 2026 06:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786280771; x=1786885571; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=x57uq5myqQEypV80yicD+m9k8ZSaT3RYYTsF64xqmQc=;
 b=PWAU+nPm9TOt5a8x6Y+6vaTTmx5XFJT8dc0SV5hl0sKI8l+6TXo5hh0PSjdAFKKWLI
 /jCsHI2TjsZRHYnKrhUahN9kP34TN1KbkKKgvG/Ud1Q8Ss03B1zKawkHUYNlf4RhW9sk
 AfFKif0DGg7NA5FZB0PQT/mwg5IuqOVLSRvuHoedNz45od54rjwuIz1IeetEo9u93wSs
 9yHKQEHdYTz8YbSTKO1jyfpYvfBBFcAowa+fkCXRF9UMcD66KtI0/Y0ChpCYXGCboKuu
 6b3U2x3WIC8RPt08wpIBt7vLqsaAniggFni8QMUTIh8LU9DYwIBjraAsP2RZMEXDACbe
 wdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786280771; x=1786885571;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=x57uq5myqQEypV80yicD+m9k8ZSaT3RYYTsF64xqmQc=;
 b=MFIthCikFtPz6vn16hVi3dojut2OaGvZ39WhZZFvEs+8qc9bJWwnf6urme/P53FRwL
 5HFN9PUZgr6MbNPFmdGrRKsAikg6Hyb/Qampdh2l1+ARLdwWDh4uI3OrHFtKxcY6PqVv
 hFoBzIDLjHMIgGa7kqlSGh6+jCcKX6LxwCHpa2c/IzOKgWtS+5wWGiZ9VQxXTK6ZuDdF
 hj/2BnEUYBKX5RnLKJJHthpfL4dVXQS7S8AYg8CQq+Hhba4aMcCSgFvKjNKBDvkPiO2j
 kIMGr30ffXGOguP3z48/o6eJ6x+toSWLYvEQv3KwaeeqzGrpL+2k1TE/Axt9Ain4CY2s
 Gkeg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrFCY89MW2rFlzq5ZGJ7Wj+raBbnwpXpL3zO0/TtvXPGccwA1rsExZBZEWaW0nbu8o0jhqYX/lqDQ==@nongnu.org
X-Gm-Message-State: AOJu0YyJ2p9hNDMP+zmOi707yVqhUyY6AaaeJ6Y5mkqVmwBUnjgs7ajf
 32ERix31/mjycIwJesTkWmtz1iljIKj8d5rhdIslM6+azDCYm9uoGKr8N7LFzSviRIo=
X-Gm-Gg: AR+sD13kQmHR+9L+brdYwBOTFFH7jKVMh7/MEsL0IF21wmNWz5PpvzfbCga241gAtIv
 IrYTXtQc5/I18ypLH83rNRMrPXWRs/rHM+CmoT2wsYVt7Hdyb3Rd4/YgHRybA0rr1njKhKPLXGb
 ePcjwOMkkbf3CyQNfOQYoM/1BY39Q5Al4CDwP+9eXQb1w+die7tDiXiq3iiAunKhkyAeivYKh5q
 JoyqA3qkcXqJnIxoC+ZgF3RVrUax6zQ4MluNqjYkjddxd+0B/Ko7g4Q1HKIqnvD4tfvRxo4CTM4
 YbmUsk2loS/QRBXmISZ4tzjIEK7n5tY9Rt5xSSGtuzXW2cS8xwTDKOY4+yGT8+asmhOt0dr/XcH
 klJMtVNPX2aAJghafqj4SCgOfn7nzO84nfKP2h6C9BVh+rriQClwqQ2X5QZoclVa8kp6CJGHUui
 hkaBkA/nLcfiv71o7b1TmM8iT/pKd3dtAPZ6WGy6ZcJ0+N7XKbDLh1YEzz20cscw==
X-Received: by 2002:a05:6214:e8b:b0:8ef:b049:7e35 with SMTP id
 6a1803df08f44-908813c46a4mr425056456d6.31.1786280771410; 
 Sun, 09 Aug 2026 06:06:11 -0700 (PDT)
Received: from p14s ([161.184.159.159]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-908a934e2fasm49519796d6.46.2026.08.09.06.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 06:06:10 -0700 (PDT)
Date: Sun, 9 Aug 2026 07:06:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [RFC v2 00/24] Add Realm support to QEMU-VMM
Message-ID: <anh7Pk4dV51de7O0@p14s>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
 <amrYWWyWlhnN2Fll@FCCLS0092175.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amrYWWyWlhnN2Fll@FCCLS0092175.localdomain>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-qv1-xf29.google.com
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

On Thu, Jul 30, 2026 at 02:11:57PM +0900, Kohei Enju wrote:
> On 07/28 13:26, Mathieu Poirier wrote:
> > This patchset provides minimal functionality to start a Realm VM
> > from an Arm RME capable host using the following command line:
> > 
> > qemu-system-aarch64 \
> >  -M confidential-guest-support=rme0 -object rme-guest,id=rme0 \
> >  -cpu host -M virt -enable-kvm -M gic-version=3,its=on -nodefaults ..
> > 
> > It is a refactoring of Jean-Philippe Brucker's initial work dating from a while
> > back.  It is compatible with Steven Price's v14 revision [1] of his work adding
> > CCA support to KVM.
> > 
> > * We are currently working on rebasing the work to v15.
> > 
> > It was tested on the QEMU SBSA machine.  For convenience, a repository is hosted
> > here [2], along with the TF-A [3], RMM [4] and Linux kernel [5] for the SBSA
> > machine (compatible with Steven's v14 patchset).
> > 
> > Instructions to compile and run the entire stack can be found here [6].
> > 
> > Device Assignment is not included.
> > 
> > Thanks,
> > Mathieu
> 
> Hi Mathieu, thank you for your work on upstreaming CCA support. I've
> tested this series in QEMU-TCG(x-rme=on) environments and confirmed
> that the basic functionality works well.
> 
> I have a question about a QMP command for querying CCA capabilities.
> 
> Jean's tree contains the following commit adding such a QMP command. Was
> this functionality intentionally omitted from this series?
> https://git.codelinaro.org/linaro/dcap/qemu/-/commit/41f7852cc8590a38c47299a35a7238da09ff9a12
> 
> We are interested in adding this functionality because we are also
> planning to upstream CCA support for libvirt, which will need a QMP
> interface to query the CCA capabilities exposed by QEMU.
> 
> Since the Linux kernel dropped some configuration parameters such as the
> hash algorithm, I need to rework the implementation of that QMP command
> a bit. If it's okay with you, I'd be happy to send out the reworked
> patch based on this series.

I am currently away from the office - I will get back to you after August 17th.

> 
> Thanks,
> Kohei
> 
> > 
> > [1]. https://lore.kernel.org/kvm/20260513131757.116630-1-steven.price@arm.com/T/#m06dd14216aaf76acab65b0a76fb84653141ea64f
> > [2]. https://gitlab.com/Linaro/cca-public/qemu/-/tree/upstream-v2?ref_type=heads
> > [3]. https://gitlab.com/Linaro/cca-public/tf-a/trusted-firmware-a/-/tree/cca/v13?ref_type=heads
> > [4]. https://gitlab.com/Linaro/cca-public/rmm/-/tree/cca/v14?ref_type=heads
> > [5]. https://gitlab.com/Linaro/cca-public/linux/-/tree/upstream-v2?ref_type=heads 
> > [6]. https://gitlab.com/Linaro/cca-public/build-instructions
> > 
> > RFC v1:
> > https://lists.gnu.org/archive/html/qemu-devel/2026-07/msg02307.html
> > 
> > Changes for V2:
> > - Fixed linux headers to include correct bit shift for Realm VM (Gavin).
> > - Removed obsolete rme-guest options (Markus).
> > - Set ConfidentialGuestSupportClass::kvm_init() to kvm_arm_rme_init() (Gavin).
> > - Got rid of kvm_arm_rme_vm_type() (Gavin).
> > - Used kvm_vm_check_extension() instead of kvm_check_extension() to avoid
> >   error message when starting a Realm (Gavin).
> > - Removed obsolete kvm_arm_rme_init_guest_ram() (Gavin).
> > - Collected A-B and R-B.

