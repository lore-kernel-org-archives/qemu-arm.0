Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B579260A2627
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Nov 2026 21:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJ2mJ0vS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xU9Qt-0004FI-2Y; Thu, 19 Nov 2026 16:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xU9Qm-0004ET-Se
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 16:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xU9Ql-0006DQ-8d
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 16:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795122749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+RFziuQeFuugCEVadJg3nGR3ocLI073RipuK0pnvkyA=;
 b=NJ2mJ0vS0OKUPItvGOS2j4jid/04OTZJY9B2pBQglvpR84YWxNU58QT2TnNWgBRZUcYLQ6
 GhpnFC+cBgzfUVa15iy/yvGBZPw3nAzg0xpGalnTDXfG+xxO9UXYm/xVjDcO3Q6AeqQse9
 34ggcpCeTSyT3KHPRa5Sp6S+3P2Emtc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-RdWfjb5GMjOUvssElGEnFg-1; Thu, 19 Nov 2026 21:12:26 +0000
X-MC-Unique: RdWfjb5GMjOUvssElGEnFg-1
X-Mimecast-MFC-AGG-ID: RdWfjb5GMjOUvssElGEnFg_1795122746
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-537548d4bc0so4711371cf.2
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 13:12:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795122746; x=1795727546;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+RFziuQeFuugCEVadJg3nGR3ocLI073RipuK0pnvkyA=;
 b=0kACc9QjiSMWHnliR0mKdc0cDUvYiKq/ahgBy910/zMEj8obuuHKF17MQk5H9AEsZN
 uAcVTgph7WIv9BlCR92QMeANlUOBmoJoTpg0XidhR+z9hTILbIFqUwTQcSqBKXj9ojnR
 FInCBrOzc7+D6guxmZzWT92lWQD4dWgkwmweQYt0MnzZdO/iSWpijmuKtQLLa9aXdpgC
 ZUimAUkzyY4KDPcswZ0GP2+Gq+1YQcyktoJFte4gEtULLaDdn2Z6NEBu3ROOie9USqwZ
 +utNG2+AselxhWIFSxSB1DYcAoOSu17Idm37APcKd4MyXktc2NyXuPH/TXXlSZ8sACWU
 pCWQ==
X-Gm-Message-State: APuU4Z/pBgth4uS9/rklL4SjVGhmlm4MOP5E6QUHCWFES3DSuuI/6V6w
 szxe2H9Xh3DxbPlg1/P2SaZScAqaFhBnmL88gYf+BSKDMxurLKPF3YwWDwa1tsAK0BNyAfJt+VZ
 c8FSE2K2rX4k3Cr7D9O1Blv9fddBOuiQVmLpm7opsdKlTUvQYtWGLaPs1bC40MQ==
X-Gm-Gg: AYBFou1vGKqG0plXx52vvW3RNvg0B9xX2M1d8//O5ZzSkZfhO/9kG2UEhKV/npEdmv+
 nnVGhjcobAThNlrV0l5tHprM3SHYjZTEKHsfupXe/frd31cfjtq21dBn0Zg+2V2LzjY2W6F2gd5
 hzlWjMJ4IWSP0iaMpLYsJ+ZV/RGYLAkUOHTbMa04wOu9iK/Ue0QE2hLKT6NrCFkem8pzUXWnglq
 Bt6ZP+b136DjV+X6jU/2bucB+Vi73PgEmHCp0wI8BGq1A5zHjDgzkoWTf4qrLZ+LKDvH7aGDvm4
 rVkjFfZ9OBSeegzXxMLV6gVuvJ1HfT4JVwJHLJ0FodOewHiggk0f/q9FIqy5p30Rwz4TFUekqmf
 aHKvzX3xcLFh0kAG7H8jjw/YHMi5ngZcdaAQRQLHfM6JK
X-Received: by 2002:ac8:5f85:0:b0:536:5663:5558 with SMTP id
 d75a77b69052e-55d769326ccmr22895121cf.7.1795122745968; 
 Thu, 19 Nov 2026 13:12:25 -0800 (PST)
X-Received: by 2002:ac8:5f85:0:b0:536:5663:5558 with SMTP id
 d75a77b69052e-55d769326ccmr22894451cf.7.1795122745246; 
 Thu, 19 Nov 2026 13:12:25 -0800 (PST)
Received: from localhost ([142.188.212.246]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d78812968sm5374871cf.9.2026.11.19.13.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 13:12:24 -0800 (PST)
Date: Thu, 19 Nov 2026 16:12:23 -0500
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH for-11.2] target/arm: Handle "PMU disabled" in migration
 validate functions
Message-ID: <av9mN8L26efXWjcm@zhexu-thinkpadt14gen5.rmtcaon.csb>
References: <20261119165546.3050013-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261119165546.3050013-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y2hzp6c5kfcD1VJCMYJq9r9OJ_glufYIu-KOu_15gpg_1795122746
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 04:55:46PM +0000, Peter Maydell wrote:
> In various test functions for VMSTATE_VALIDATE() fields, we check
> whether the migrated region number register is within bounds (i.e.
> less than the total number of configured regions).  These tests fail
> spuriously if there are zero configured regions, because then "x <
> cpu->pmsav7_dregion" is always false.
> 
> When we allowed v6M CPUs to have PMSAv7 in commit 157f6c69edd06, this
> exposed a bug, because we now have a CPU which has PMSAv7 according
> to the pmsav7_needed() function but which is configured with 0 PMSA
> regions: the Cortex-M0.
> 
> We could fix this by having pmsav7_needed() return false if there
> are 0 regions; however, the cpu/m-security vmstate struct does
> migration of the secure equivalents of these fields, and we also do
> a VMSTATE_VALIDATE that checks against the number of MPU regions
> there. Making those fields be migrated only if there is more than
> one region would be awkward (we'd need to pull them out into their
> own vmstate struct), and it's unnecessary -- migrating something
> that's all zeroes and not used isn't a problem.
> 
> So instead we relax the checks to handle the "no configured regions"
> case, insisting then that the rnr field in the CPU state (which
> should never be used) is zero.
> 
> Similarly, we adjust the check in sau_rnr_vmstate_validate against
> sau_sregion; this one is currently theoretical as all our CPUs which
> implement the Security Extension have at least one SAU region, but
> architecturally it is permitted to implemnt no SAU regions.
> 
> Fixes: 157f6c69edd06 ("target/arm: extend PMSAv7 support to v6-M CPUs")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Not that I know at all what is happening.. but just that I think we should
fix a source crash during migration before we stop asserting at all,

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


