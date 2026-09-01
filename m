Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BADC61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 10:21:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1Lbl-0006hx-4f; Tue, 01 Sep 2026 06:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Lbj-0006hh-Sd
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 06:20:47 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Lbi-0002Xw-Bl
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 06:20:47 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-85a50f6a7f7so52220377b3.2
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 03:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258045; cv=none;
 d=google.com; s=arc-20260327;
 b=Ejih7Tc3iODEQdpLNfv1o6LABfTLS5Kh8a33wyY7E3RfXhiXHJCwkO1xjDk1/rssp1
 /NnaqY35tnzI1U38ZfU0r1Z9dwmbx4MBtOxDuzsfsTiotjEoUDKmgSgE5gy1KcxDXv9h
 CJj2jyq0lcdkVtxNEr3D6g2xBYf9T4P0Wp9jTeAbI6FbAcrpFmgpj6JZ68baYByuQe7n
 /Jc5rAKNZXDq08T9OhV9OlxUSJp7Q0GBYOzol3LOKQKaNoKpl3e7f3Y32xRlns0Mxpr8
 AY/QY7TYx+uJD+jYXr5BYq5TiGOKfZl8wrvRyCHY9P7ayvO40Rxq5n33C8maOInzeJcO
 doOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QNcckCwmmv60hnws8+62+nxtDz2VNaU9Y8eXf7nRzb0=;
 fh=2k4/ywRmkMdKtLowQA9OoObHxawDjiCCpoJzRedtz7k=;
 b=JuilKEbraMh3GjqXsITRHaE4UPNFG1nNyErUDpHxBvVsrJX9kwKIgTt8iYK+v1BOx+
 DlFuVjDvBbwxfwi/yjse3Il735wGHd4/h9cqBd/IX9dOUxCkbRy4/9Hu+Jhtkxyreo7b
 xpUKCtoXZtDLd9L6tdNS3fXS6TQllEJtt4i3jB36piMm4xG7tPNMeRQq7bKKzjfZJlG1
 fOfXGzu1Vm556WIjmBEr2/jx+TqdSfw2Q29dQJHOoQcMWSoT3LA8y/Ram6dxRdcOHPyL
 VB2zi7h4pOqeBTz/MCfOVny8BJos1DIKU6oSdHBzoZF3+CkXsRJf9FXOY00NbeXNFjKv
 HReQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788258045; x=1788862845; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=QNcckCwmmv60hnws8+62+nxtDz2VNaU9Y8eXf7nRzb0=;
 b=RSdFyxNCHe29TYEWg6VqUY1nJEn4tPnP+ggFyFgd461qYtBL9GDbvo5AaS43cLhIRC
 xy55CClJ/LfsSaXkxIzKwGZ88EWNErddiUCmuSsMiaAPpTDqcps4fued+HKvOlPWQB/e
 GspUbxmUvNN98PZdVE+SrKjirG4nP70teqs20l7qkiS/ChEij7tmTJuK5rN0RKebBPC1
 QOTUSrMg3zrr86uWIv4aUbTJBxLtIYQsPs3gEWJUNJMr8p5+fONIluGMUDL45KGygfBk
 X9knLz47WY61ymyfz5ApZNjBGRk9e6bGZFlOr+45M3ScqBEc7bfm2LXoX+5/08ipCApL
 RngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788258045; x=1788862845;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QNcckCwmmv60hnws8+62+nxtDz2VNaU9Y8eXf7nRzb0=;
 b=ZqXVlaeN7hBSnheUAnIUuD68Ko+UivwaYPYY9exlxAcGMWWgx/1CCcO2FpE13STS8s
 RTkave+nbmCiTQ/ftWOk/h0GInVs8aU/SOVnxlGafdd2A0pWXgq+2B8u6wR+7f0uEkTT
 YMf4H1Tdji1WQSiJ+pUBVC6sKHXaws6NIA5G96bwMnCJNa74adDP+Ehb5q8rW95xyZgq
 wrQ2Qs8db4mW0REi7XJ4H25cl1joIR9J8cRDpVjdCYxHc7zmHtXPMfkiA9GgmZPwepK7
 rHKzHXwGCDXMsEONo9On4xy9PFAGLqDJh9w7UzmBXBAvkGMBhKT5H6EBR5ZbMDX9YO+1
 LHMw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzG8AP8PqmTkfkoAp9kud131wl3oh+e9uW2eDTmQS6zakOEKik2ig40xPcvgA95Ihsnnp70Vr9I7w==@nongnu.org
X-Gm-Message-State: AFuF++kyEoPir+LSpyQilP8vxHq+ROciBKozYbCX+AaUrYtvrmsaLH4C
 6hwsdThVMCg4RDLygDy1nPlWH3JPiEXJSPepgyYxv9e2T7pebKs8iO/zsIf4uhWTjLozUcp6nOY
 gMB8UgChT218YLk8LocK+Ne/2i6k96H3TR4hHCl7f8A==
X-Gm-Gg: AYBFou1T0DmCLNkHwO6aHmPc5wt2dkUvxQjMfmoj8plDQhGvC+F4JBG4dSni3UzfoCE
 qr7/o+SuW6vJU7qNhyh5YUyrTz8+b1ODS9iVfzymCb/ReOlOee6JWq9Y1QVUflb3zCk1vSadiyo
 bpC1D95bJvoM0jcnlivDlJXy7CReHXUqCIqKOqug6fuls/MIKEl2VgelCSZ6hD8NvLy/U/C5OHr
 8bBGffnKq3raqgj1jQZQYJCqA1Eu0FcPjMQojLfK46IiaEBXzre5bBw3DhiKsNqYJ+AvEFLoVRY
 JvhXrGrSJcvcqedKvBDgMbcR1n+B66tQjSrLzQ7B5NV7Y54rgQIquLbTvPG4Aca/UBYn1iFSwYH
 2zI7Xw35Mzr8BG09poasNNBf9IAWp
X-Received: by 2002:a05:690c:d91:b0:84f:cd89:30f1 with SMTP id
 00721157ae682-85d6a1ec0famr129707567b3.18.1788258044530; Tue, 01 Sep 2026
 03:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260806172709.333300-1-richard.henderson@linaro.org>
In-Reply-To: <20260806172709.333300-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 11:20:31 +0100
X-Gm-Features: AcwNN1Uylh42WQyiR1dQ8s9ahMwqx0YxIyDleKvAN3cfNCEVdZaxUF6ZpVBrUhk
Message-ID: <CAFEAcA_RTXJrwjsYGT5GOtmULbRNGFTTaokiqV031XqTtUXPEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] target/arm: Implement FEAT_FGWTE3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Thu, 6 Aug 2026 at 18:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20260806163939.328201-1-richard.henderson@linaro.org
> ("[PATCH 0/7] target/arm: Introduce cpu types max-v8 and max-v9")
>
> Changes for v2:
>   - Rebase on the max-v9 split.
>   - Review comment fixups.
>   - Set fgt for MECID_RL_A_EL3.
>
> r~
>
> Richard Henderson (6):
>   target/arm: Add FGWTE3_EL3
>   target/arm: Add FGWTE3_EL3 bit definitions
>   target/arm: Add FGWTE3 FGT bit definitions
>   target/arm: Implement FGWTE3 traps
>   target/arm: Set fgt in cpregs for FGWTE3
>   target/arm: Enable FEAT_FGWTE3 for -cpu max



Applied to target-arm.next, thanks.

-- PMM

