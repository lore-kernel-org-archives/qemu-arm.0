Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA672C87FCC
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 19:22:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhYrF-0007cR-Dj; Thu, 31 Jul 2025 15:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhWof-00074B-R0
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 13:11:41 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhWod-0002np-SG
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 13:11:41 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e8e2b50f8f1so1308456276.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 10:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753981898; x=1754586698; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=437EfaWyAbws1fUTE8ezyQL7R2lax3qYd8TnsU763SA=;
 b=F+HmG3a9vsVIOyXYH28vXXiJxUHEU9L1+wz7eMALW+XpLSoPWDy1YoPElMdwQhjeLf
 AvAWWERS/0WbyFWQ53rgJQjUsuUG94irS/U8YfCsVXIZN4ZxheXv3xSZx14hxeeKdXVM
 /kh/m4jj6p6y5MUPPoFc37mr3UKnd5/Y3LZvKHG99AwgKBLl9o0623CnM7MMBIQ7tKs0
 HCScew90oxE8IBsZ9VkMFk34sUq2NybBOeFJqmXCwqEPmzW6cxeRBml6nstyo9pOt6NY
 RLXj/WXIIqds/SDAOX07zV33g60BW40+QmCdE8eKxi5yMByqRqciZ8u7Jh/AcJ9q+j27
 27OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753981898; x=1754586698;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=437EfaWyAbws1fUTE8ezyQL7R2lax3qYd8TnsU763SA=;
 b=veXLzmcjRjkHFnkEAxFpCCytY4rY9CwGeFOOM9OCB7d71uXic9cqrQY72TtyBc4MMn
 BTQUOySO66gls/oTmlqKNS03iANdwA9TSzbjXDTnRoUFAh9RpkYU7t9d7On09+aR75XH
 gnm91DLxdzLIpmXfRa2OqZUR2YrQ8cVRDIjDUWQ28ozlolMGVmwFTTsCyifPdBicUvqx
 y23iZKB6nFUorHsqSsx1bxIT9sTE+t04cro52fnoJ6AcXteM7OlqEyHBn2jQ9UyuCxuu
 oqc5UGp1OPzGuSlGtMhUL0mJ2yLgivYYnX+rH3Vh7Y9ee7+H7rFh2VIdtj1XhFtI+D8b
 gF/w==
X-Gm-Message-State: AOJu0Yz4kFKKGV6acUFLzz8tuDi6leXsLWQGqk5nFoMJW1l9r0GxhJ26
 dvn5mpVobDPbjyDzF1i5LsPhCWTZ9Dh6iDHeqspEx9ygwIpRola20nLOey7sPXkA+dS0OVuekdr
 SzS02UiNhVk9P0Rne4xJvMUzj9sxUjw+HU1GKboPcFw==
X-Gm-Gg: ASbGncuoCf7EO9+IgJCIED+JmHOH1C3hV8q+hQtmlVlV00j8NU2lN0YL6lCPWzQ8pyo
 sCzOMGEFXNtIf8FkNyM+cEFNiZiibTAjxIwsb4DtOhpEyUnI06Vx24hFUt/nl91aP2VRuBKrgPQ
 /lTjmux9LmxYIeeorC1CzwdvUSKDVm9Fr+H9iR0JMz0kSszSD2V51XMYERdr4I+yQsM/9CtKLTr
 OhfBdco
X-Google-Smtp-Source: AGHT+IHaoyIgnDImdZj5451kF7XQGbW3EIfnRo8vHYw3SlJY8UcWyVte8JhrZ+emmvrNXOZvMMprn5DDS2GPPM2ppPA=
X-Received: by 2002:a05:690c:640d:b0:71a:251e:36ee with SMTP id
 00721157ae682-71a4696dc39mr105768417b3.39.1753981898059; Thu, 31 Jul 2025
 10:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250729161650.43758-1-zenghui.yu@linux.dev>
In-Reply-To: <20250729161650.43758-1-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jul 2025 18:11:26 +0100
X-Gm-Features: Ac12FXyCjxHGcxU3b0lInW5pSCJ6upqutpBN4ZWL-U213zkJ7YtcTibg5DA0wyg
Message-ID: <CAFEAcA-dRAViFBSvmYS+FSMKPhP_ej5Sv90n6+WLaR=jeQeiAg@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/intc/arm_gicv3_kvm: two small fixes about register
 accesses
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Tue, 29 Jul 2025 at 17:17, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> Zenghui Yu (2):
>   hw/intc/arm_gicv3_kvm: Remove writes to ICPENDR registers
>   hw/intc/arm_gicv3_kvm: Write all 1's to clear enable/active
>
>  hw/intc/arm_gicv3_kvm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Did this cause any visible bugs, or did you just notice it
by code inspection ?

Applied to target-arm.next, thanks.

-- PMM

