Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F9E1093194
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 09:16:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3VxY-0002K7-Nk; Fri, 20 Mar 2026 05:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3VxR-0002IS-Bv
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 05:15:54 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3VxM-0004Lk-Oj
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 05:15:51 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64c31ca77b4so409570d50.2
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 02:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773998147; cv=none;
 d=google.com; s=arc-20240605;
 b=RWocUdCXpvmGyOrZePMCWRbw81Q83hit5Df2XVlVLUQCqQiz19i26ZG34eTzZVyJVx
 yStdSxUAQBcNEkBnyk/3chf74jcv+jUgii55pv5aQeOKf3xag0bKlXbvBdKjbfOq6s/0
 d0AV2oXZpEWUHsF+RN++qVp3kwY4Dk4a6+F2aBapYeq7Bk4/1MQeMs2M1OC2EZ2gowwT
 jWEQN72NMpk93UIxHMM7bQmGjtReHPrq5UHlfq0AnUncEJuke2qZIqZ3WhRUDvaC9enT
 hxoAvdaoxRcTm9MAYcxLE0JglEkXRXo6FoRsOjgYMXgl2c0g9Oy7Q4K2mur8VdFtBRrB
 xYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xvbAbu4dMgvGESlCuQajDMiqKKtL32Q9bNx4dGp3Nfk=;
 fh=6pva960Ed1883vrAM+SgImlMfQiiJ9krm9/7iu14A+s=;
 b=Mi3YonvDIx93x9iuKZ2bs+Ai17f7twL+DklYfgeGn0v8vbjssHwHIUcjAhXXidRvzD
 t/Xn4DQzko/1MGEIB4VWRfLP/nOclG4KNcCivoJYCB8BAy9KvwGcC2rlGBJEhNA+C/0C
 i9U1CLvGavoBLBenfK0YsPkC4YLceN+CUZc+fP+EDBY/jy+LdygeMrY0OHdDJ5NYLvT/
 wteKCUKd/dMRmAMt0tXWycxDrdYsoWWShBDlexKmBgaFmR+NLE8eGGE2xbA1JLvoY3Tn
 Xbo4P+wAhPVgax1u7yd3ihVds+60ogI+2Iej0BNqt5JbNlNQDj6uHzk/Pw2UH34y9h4s
 dm+g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773998147; x=1774602947; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xvbAbu4dMgvGESlCuQajDMiqKKtL32Q9bNx4dGp3Nfk=;
 b=B0XubGYh3jCz2LqywfONlu1rFNxlQhd2hfAPurHlX/eXrlutLH/Zsepaf6zbQMtEqi
 ubxOijU1Ifw9t7cngcqgqAys1s23//vG2RhE7qxy8yRyk7DhBZRg5QkNjqse1NV2S/Fv
 lBNrZLgTp4Y5Kke8OH9y8LZ8lnEMNyRHcnxADQR4VTKa8ZmX9xqdYqBswSciYY+5TXQ1
 4t11E3GtbExurOT0D8pte1dihYKZIKWgeRvxnp1J2LBnpWy9XrGs8PmJuxtk76PHNroR
 h51hPWqb7Ff96UyfOCHHDV9/jsh9tQq9yj/YFItX7JRGLWVWL7H6PwvbOC1Ucc1T2kSW
 j7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773998147; x=1774602947;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvbAbu4dMgvGESlCuQajDMiqKKtL32Q9bNx4dGp3Nfk=;
 b=TDsmGmW2mPJaGXxkKf+JY2DD2lT8oNm05uf/TP/MnRmVBQZlBJJcOAFx3M+fSlXhOY
 bN4m/LeWtMbGi23CszI/rWVmYfwodhOqyxQhJbNG+3zrIzHFSPSPVljWcJvqKOjoEc6g
 /H4dxDRANYoN8tSZV25aGkeuLKgbXACTe431/lwxs3Lg+fSHp5GPlIkcNZiZgYjVkVfD
 3G/DH0mZygEk8eQIb6i1CBGlP/PqccIOCKgxVWlsZFbABAQgf3XM5Y3aO/EX6HbKpIIZ
 XZEGeOLe5FKJBAvqjaRhIcY9G/PXAh5C6gi0r6GuRAYSNHbX7QEaM8HB6vptGaiLymPP
 ZxdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzgezYpTUnAMFrrsnjjiuIvIQ5tLMua5qMHZjj17uo54Zp9q0c7aoLV0IViKJLymqpau65Sdbp5w==@nongnu.org
X-Gm-Message-State: AOJu0Yz9T+J2IbnJSnSTZpx+Dw+HYBOyz9Oy1vLEuZtsZv6/ZbKTF8Zk
 VhIrG5Fdd9HHwFYU3gqYCMGjGGSCcXXcK13MlhjNIMNGkSHQvabbziGmy33OocI4Guh6+w5PfUZ
 AfgeB5aXj8ktQQvAvkfeida+VRMkTvrYtzxNQHf9bkQ==
X-Gm-Gg: ATEYQzwSqQ4tDrl9cGaHnYXo9a+2c7nn3wCYqXSVjncRShDrQcil4+lad/Jzw/NexN7
 34D19v8WlcBPYGwrMaTX3x0liCpO5dE3l9m1ZAmntwHSjR7x0GwDknPhiBE3vg2VWIbu8/KuVez
 GiXvsYmu/ZuPBYWFayDJ31mXRlWJEIlP/3LlSc7OThxouR/bZE9CN9n/keuFi0ZTA5XUpOTYoBc
 ipCtIgUghMEHmsf5YNhwNlZMlgSvnfrB770nc0OvIxd4YlvbfPZeX9fHg4Bz5odFYbQgsG+qu9Z
 uh441QAQbHrATXER2MQNiT/zm1kVPKXukGSZKYAFLnFWmyZWqxW+rD6HWvmC6WegTs4=
X-Received: by 2002:a53:d786:0:b0:649:e546:62e2 with SMTP id
 956f58d0204a3-64eaa7b630cmr1712151d50.44.1773998147305; Fri, 20 Mar 2026
 02:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260319183453.100545-1-sw@weilnetz.de>
In-Reply-To: <20260319183453.100545-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Mar 2026 09:15:35 +0000
X-Gm-Features: AaiRm52Fvg_cJmMP4ysqAEFDoenflm5VgYoBeXreXaBQdPTgtKQsso7DZjlREB8
Message-ID: <CAFEAcA8dzqPVUyt-bC4r8QxZtJ6dBacgeMG71JEsCsUoGgDsSg@mail.gmail.com>
Subject: Re: [PATCH for-11.0] Fix several typos in documentation (found by
 codespell)
To: Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 19 Mar 2026 at 18:34, Stefan Weil <sw@weilnetz.de> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>
> These typos are part of the generated documentation.
> Therefore they should be fixed in the new release.
>
> More typos can be found in the remaining code, mostly in comments.


> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index f8d446b3d6..e8adaaea34 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json

> @@ -5086,14 +5086,14 @@
>  ##
>  # @blockdev-set-active:
>  #
> -# Activate or inactivate a block device.  Use this to manage the
> +# Activate or deactivate a block device.  Use this to manage the
>  # handover of block devices on migration with qemu-storage-daemon.
>  #
>  # Activating a node automatically activates all of its child nodes
>  # first.  Inactivating a node automatically inactivates any of its

We should also change these to "Deactivating" and "deactivates"
for consistency.

>  # child nodes that are not in use by a still active node.
>  #
> -# @node-name: Name of the graph node to activate or inactivate.  By
> +# @node-name: Name of the graph node to activate or deactivate.  By
>  #     default, all nodes are affected by the operation.
>  #
>  # @active: true if the nodes should be active when the command returns



>      ``param=string``
>           ``string`` will be passed to passt has a command line parameter,

should this be "as a command line parameter" ?

> -         we can have multiple occurences of the ``param`` parameter to
> +         we can have multiple occurrences of the ``param`` parameter to
>           pass multiple parameters to passt.
>
>           For instance, to pass ``--trace --log=trace.log``:
> --

thanks
-- PMM

