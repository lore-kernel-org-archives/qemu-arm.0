Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FDACD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:02:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWysN-00070r-6b; Tue, 09 Jun 2026 12:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWysF-0006vs-NT
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:00:19 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWysB-0001mk-Rz
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:00:19 -0400
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-51765531803so2727151cf.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781020810; cv=none;
 d=google.com; s=arc-20240605;
 b=NlPDN6rJIHsTo6hDKhpHkNtO1elOGSzzk6KalympafY++ePMFjYn+lYa/GO6vN6u7M
 Z+cJLcGgQoWYHw95Tv7nsRkgVO47nCevZNflqOMCk88PSttBLFcCgBflHITEtZ1fSqtn
 zONW93fA8w7CEPp2Cnuns4S3l3VxJB9nfDETRM1AgCe3Xi6X1giaE2j/UeSJa8QjVZAS
 XOJ329s1r7uxLwIdHNFDz1L39BYG8Bg5U0sPvdvRMRWpUbFsyfabvhTlQS3ee7J9+6ty
 vs952XyX5hDpl89SMUXltntpJjOroVOQfmRsiLdnCyCFd7ux1PjWTMA2nOu8OhBHmZW4
 ImJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TwwxK3FbqgNRzq9cSbI+NO5X1AaMIOH6AUHYNp5pS0c=;
 fh=vFpn4qIp6nj1gt4GI3N0uCUXvmWJr+YXnd38+BZ9HBs=;
 b=DV5V1Lbc5diqyRvXIWR1WrAtLO7e4LMVFWyC+N2bRyJZUxVJh4K6CQcWXFBc1aknLI
 uKye+Cp7AouXYXaCpYYiGbIcOt3o61OpRaAFgNC2LIaNNcCsp2iZMeepG8pGqoznxsZX
 07sHy4XP6q4tr6bIv9cAq2WiZTwNZx5upncqq6OFCilpv3jSWt4TU/wl0GajVKiHwVdI
 mI5pvFNDFTm1fd6E32etoVXi3NWQejTG/UkNmebMEm1gemEsRT77VESiudc6cFqnzS66
 gbiJqDTuW200g3rzd3h2FI6RglJCeGAC0LkNH1ZnJe9c3hIheQzngPuNATEsK070eAM7
 kk/Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1781020810; x=1781625610; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TwwxK3FbqgNRzq9cSbI+NO5X1AaMIOH6AUHYNp5pS0c=;
 b=MDyA8+Hc4Qg68ca629kJTf/4xVNY9Fb4cL2Xay3sWEDYM0YUJ5ct0lTMQf5oEvp8VT
 J9C8xz02PNKV015W0VNc/O+MknHtjxj6StVimMeCsUNz1/nK9+x1RJY5A4ERCwUPXcNy
 HBYoUL+4yZkXxkNJeMNomkKTXhi/X+dtrsEpCCEl+i2SyLR4MB5uY4eZbE/gCRKWD/pD
 5bDbWkTjlBuWRss+Ut5VQUxSXk0d28uyThinObUiUE05CYyt7ims5/Pb9tZMwHPbQogq
 bB8wAC5TDS2eHLVEoplw0RbodXVlk4hpOPGnDeyYr5cmACERAB/txtjF/xyQGi5Ovfn8
 iuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781020810; x=1781625610;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TwwxK3FbqgNRzq9cSbI+NO5X1AaMIOH6AUHYNp5pS0c=;
 b=ZW9mWSAyABD7+3MenhC6lVA19UuU1dGy6VIeRVpaJEkEOmtlgysmp8lEoyV6v/NAut
 49FfTHqE5QsaYgyGiIRB3SxQrSaGtvjStdia6c8Xa22lN/+ojfO+jJKBUHNKiYEKUXEq
 LeoE3TPM2D1GSEIcBPKO+JOypUdHdRfAYbS5U5jHCSA9EHdL9Sm/ATULXrbzxnAPqk/g
 Bd0L2dURfPsDqKmC83yiqb2sYszZ/e1Es9Gia6L0P8fMjUyV1GCoI+sRFSIUuI35XRVn
 jzJjbnWUid5WuZCmTBuKMUk/YXvF0HFxtzP+/bxlRbImINeJbjBnj0AQ4q+AZkz7yipw
 IqEw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9tZ4vg34pX5WEVYrZD9ZIGRcy6HMd61Q8dDPE10wY67bp1e+P5CpPpYbC6b8ac2vDnKDhRBLElBw==@nongnu.org
X-Gm-Message-State: AOJu0YyKBnul1zf3O3Cd5lY35UhXMc13D3qs825XS6ofNGYBWMCVh14v
 QCrlmOWuKaqyqtvFDcXvwt3LGB9X3OSqG2RR2YqXocN+9xNsa0sxii0N4KdMA8MPabLSOhku9X/
 zUaxpMAw6f4sKn9gUS21LIs/Nvx2sFiuum5wi9D52
X-Gm-Gg: Acq92OFSZQhKMaQGmBFKZTHUuB1auA5kKJ2TzndQveYnYgm5mXjh2k9X2p03jShWoTg
 LIBg5i346fPOUftU+0Z9TrBnGYLEJ8sNCgGYJ/fGOAgbERo2Ht+dSkMMAnml/ZtAGjDTjAQz9pA
 xCpB4as7HVZ57pu5XPQzperpmS3U6AZoROPukKF0C3YX5zS8551+QUPS/AhlKlUv/a0T1ulf3ri
 7GgOuEPKDbrUrQ1VNlV10lbhXTZvuqRrTuOpaDT7FsEloBWve4Xh7EmFbVFoYkdifd3AM0uA8eS
 jitn7yVQHTJWKbXywmK37F9kt4lk9cg6e+Daowx+trqMgAsaKA==
X-Received: by 2002:a05:622a:1b03:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-5179826672fmr38760001cf.15.1781020807491; Tue, 09 Jun 2026
 09:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
 <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
 <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
 <CAFEAcA9N_O7RZRU+SPTfB_ePasjVZvUsFPhndfQDuHgQ+4Q-5A@mail.gmail.com>
 <CAMvPwGpzAcDxeqSvQmOjzkQn6T91CAmTO31bNs0wmSMqQKG=Qg@mail.gmail.com>
In-Reply-To: <CAMvPwGpzAcDxeqSvQmOjzkQn6T91CAmTO31bNs0wmSMqQKG=Qg@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 9 Jun 2026 08:59:26 -0700
X-Gm-Features: AVVi8CfSCk7cpvbPjjjcictp7Y5ynWYI7fOzBypElkdPKdJ7m307ZuXjj3z5Npc
Message-ID: <CAMvPwGrnh9-UMv5919bLXLF8oLcyTa=coTdqh+1ALNvCKLmOJQ@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=titusr@google.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

oops, the patch series that fixes this needs to be upstreamed.

-Titus

