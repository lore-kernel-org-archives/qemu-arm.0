Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1041764wrw;
        Tue, 6 Nov 2018 07:48:12 -0800 (PST)
X-Google-Smtp-Source: AJdET5fnNENM38CJ96aDlK8k8da63Mok6Rhikhg3q0cdfPzYMO2EHIQVBa8JFHG1jq4HR/7jJWzx
X-Received: by 2002:a37:8743:: with SMTP id j64-v6mr24796276qkd.210.1541519292708;
        Tue, 06 Nov 2018 07:48:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541519292; cv=none;
        d=google.com; s=arc-20160816;
        b=PitXQYFp8T4qysoUtAsWKcOCTfP+U0MFB/mJau+cdTZ9v9necK0ApQTa5xWhb9YZlV
         htIB3w5/rEhgnc0Gtq9TA5hunN/xgB0honJFZ9Q4jICLUBgRI8yLQq36XifzqNNNg0is
         DpG1ZgGwiYGhvg7Jwud7ysbXStoE3Pk20vmzXZkRi9Hoku9AqkxNrJIMs6SN/Su3AQ5b
         ZIFJaZwCu48Yi5t3Zaq5a1hlBNhLBmITpL0VBu9xOB0ycUb/p8jqN/JrevIP4ihztuW0
         bordKYdGgbNSPojR+DPvovKAohbKR5ObBgzSqSqea13Nbu5ZtPPCJEBD0k3elpPZmUvW
         fPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=NLbHLAaXPnqebwye0n3REK4xpkkKTE9x4/akycv9VJs=;
        b=e3q7+HWub5mAs158+NgOTAMXh3kNQLuz7/gVcRbY8nXUHCoQ8qSivG/kT8RhFNFQ/w
         LRiwKaRxxil327ShxEmGBwQH+yelcpB1IsV3ySuy6JLGTAWeJEEI+smz9gOpgocnG7SJ
         aLRIu6cvUhioFpL51oGIKqeIl0SBd4ErwhpQ9FucYvpt+8NxFx+RgiH8eQniNupL6NiH
         D/KEnlwwMb70Ic0Vb4iXjuWVT0PiBjKPxIL5nIzLeBiYto6kB8Zrayd17btjM/C4o3R6
         EPNdRbkmmQ76jqz/38+Ur9eA1b4gmNoP1zfZq8oHVLDvydwGAQvlTEIYaFGBSociJ8CF
         NNtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VXsMj3NC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q18si3293025qkh.210.2018.11.06.07.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 07:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VXsMj3NC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gK3aO-00028E-6Q
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 10:48:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gK3a9-000285-0A
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 10:47:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gK3a8-00048K-7P
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 10:47:56 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39537)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gK3a7-000470-Se
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 10:47:56 -0500
Received: by mail-oi1-x242.google.com with SMTP id 192-v6so10331499oii.6
	for <qemu-arm@nongnu.org>; Tue, 06 Nov 2018 07:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NLbHLAaXPnqebwye0n3REK4xpkkKTE9x4/akycv9VJs=;
	b=VXsMj3NCkZyUwYtaDcvpSjEiFPQUrSSOByXENLHygnzid4Ijm72OB0f+qYvVJ/rxyP
	oV0YqsB35qRU6QRFPidDLz9oPlCqq7qWdeNx3gk5fWuWAtbOt1ljOfAi/P7F+YD8jBdY
	bq7MAsd0/Z7dVxHDyS+ICgi0okRImk0G9ij2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NLbHLAaXPnqebwye0n3REK4xpkkKTE9x4/akycv9VJs=;
	b=csQeI/NUAiN2Tk1Hb4FWWXR2pvraInwtuUEozaWLy4cNkFndJlUBySnOsf1QZynV67
	EysDlHkKEjTltCFcmpfb00A+6Q4qh9SYbuOoPNPp6LRjHLYWSB1Gs40LYwCNQL98PRTM
	e4MYjxeruPqx2Ai/h7HXzvxeL3Sy7nMcp1IXyzI9D0no4ySwGd3lRZgZamvPyTtNKt6c
	ChM/YuQvrsJjXCoWzVA9gOhb9Kl2OtAeNEnRJHUo/Dg1aAZxbP3DHRJUfziW3iTEDLSc
	LbDtuzSZVG/Gpu8VY5h6balQiksbhdAaCLbdGi9JSGxHZGB3S28OIW7WSQr9bDW19l+v
	kprQ==
X-Gm-Message-State: AGRZ1gJoSu0RRBjpD99lN2ALEE+HJbX45g6megfWOBLDMAaq73MwGjM4
	X+yW3LMMUVQCN5vSQmmYaszoJV0iG9rWRZFzMJoONQ==
X-Received: by 2002:aca:ef56:: with SMTP id
	n83-v6mr14760471oih.146.1541519275101; 
	Tue, 06 Nov 2018 07:47:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Tue, 6 Nov 2018 07:47:34 -0800 (PST)
In-Reply-To: <20181105153520.18528-1-eric.auger@redhat.com>
References: <20181105153520.18528-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Nov 2018 15:47:34 +0000
Message-ID: <CAFEAcA-9gig3vNVF0QwpCPGCrA_1NOTrd=ALnA924jHJEWa4mA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [RESEND PATCH for-3.1] hw/arm/sysbus-fdt: Only call
 match_fn callback if the type matches
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: App5yQrUqk0j

On 5 November 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
> Commit af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with DT
> compatible value) introduced a match_fn callback which gets called
> for each registered combo to check whether a sysbus device can be
> dynamically instantiated. However the callback gets called even if
> the device type does not match the binding combo typename field.
>
> Let's change the add_fdt_node() logic so that we first check the
> type and if the match_fn callback is defined, then we also call it.
>
> Binding combos only requesting a type check do not define the
> match_fn callback.
>
> Fixes: af7d64ede0b9 (hw/arm/sysbus-fdt: Allow device matching with
> DT compatible value)
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/sysbus-fdt.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 0e24c803a1..a44cf7f255 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -449,7 +449,7 @@ static bool type_match(SysBusDevice *sbdev, const BindingEntry *entry)
>      return !strcmp(object_get_typename(OBJECT(sbdev)), entry->typename);
>  }
>
> -#define TYPE_BINDING(type, add_fn) {(type), NULL, (add_fn), type_match}
> +#define TYPE_BINDING(type, add_fn) {(type), NULL, (add_fn), NULL}
>
>  /* list of supported dynamic sysbus bindings */
>  static const BindingEntry bindings[] = {
> @@ -481,10 +481,18 @@ static void add_fdt_node(SysBusDevice *sbdev, void *opaque)
>      for (i = 0; i < ARRAY_SIZE(bindings); i++) {
>          const BindingEntry *iter = &bindings[i];
>
> -        if (iter->match_fn(sbdev, iter)) {
> -            ret = iter->add_fn(sbdev, opaque);
> -            assert(!ret);
> -            return;
> +        if (type_match(sbdev, iter)) {
> +            if (iter->match_fn) {
> +                if (iter->match_fn(sbdev, iter)) {

"if (!iter->match_fn || iter->match_fn(sbdev, iter)) {"

would let you avoid duplicating the code in the body
of this if and the else clause later.

(Or you could have a match_always() function that always
returns true instead of having to special case NULL.)

> +                    ret = iter->add_fn(sbdev, opaque);
> +                    assert(!ret);
> +                    return;
> +                }
> +            } else {
> +                ret = iter->add_fn(sbdev, opaque);
> +                assert(!ret);
> +                return;
> +            }
>          }

thanks
-- PMM
