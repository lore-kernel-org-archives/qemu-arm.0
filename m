Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp235840ejq;
        Tue, 16 May 2023 00:26:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FsgkCIQZ6mvbtMcPn94pI70K3bVbOPfDzi9YoN5th3BLjhVKxi4VCMyJ4tQLBH9+PPPhQ
X-Received: by 2002:ac8:7f46:0:b0:3f5:4699:105f with SMTP id g6-20020ac87f46000000b003f54699105fmr616732qtk.32.1684221967280;
        Tue, 16 May 2023 00:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684221967; cv=none;
        d=google.com; s=arc-20160816;
        b=PZiQ3HaPyGK+O2NSu8Vym/9tVWUE6wcGoAb2CKEoYAnFRsPaxqlTkFk8t2bU3v38/a
         9B4hXqoxK9SgbpBb9GjAejNaDaWlkMEYzuGGQqiQKwywlmdz3lO/cO2KjUwRvYy2O1y/
         EBPV2Q829sG06ibkU9vQkKY5If4qnrXa1mLLPk+yUV/vwwnralXEriW1t8WpMuEz8Yw6
         p1Rf7oeH7UuoPnLegZ+ZFMkb6JwJhtOl6C48R1eI5rfxCuxeB7QFus4uJYIql2RnYo+h
         cmkNB8HRX1qfjjU0OnqkHspDcdqGyq8+xMWcofni9mgYUY7EIRGkeFDGGHRhOwx8Qf4d
         /AHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LWOCyyIV2btvZAvfYFkoh+ctTip8VAimAdpfAKKDpYA=;
        b=R5qJSVin/EsQosCcsi22N83v/r7O4otVlZFQIIEHmWJvR2ukWAvMSrdFGXIitJQRwV
         80yqtWWJdIAkoql8p+B8VqECsxCzsyJ+jZfRtC+b51jCm/Grh/ujfXJ5qaG7GxFz7Kdr
         CRv/l7X1DdvY71Sg5sqSaovfHSa2mIzyMt2ArZ3b1WtzSkYmlUEQXnCtVewAKMTbBqtJ
         luVnUC9wKnj/FkKpWhu9bE2xHJehgY/nIKebxXc2xAbjSmtiSSpQ8JQz0z4XTkHNUEqD
         2UvJl708CYho0Sv3o7EbS7S7HE3INmrZxepHL0OVS6WdfypgDu8MEG2PksYzObq4wY2v
         /KEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@anisinha-ca.20221208.gappssmtp.com header.s=20221208 header.b=sR6sKjFC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020ac859d2000000b003f277212340si10473160qtf.630.2023.05.16.00.26.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 00:26:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@anisinha-ca.20221208.gappssmtp.com header.s=20221208 header.b=sR6sKjFC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyp3v-0002FQ-5a; Tue, 16 May 2023 03:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1pyp3t-0002Eu-TI
 for qemu-arm@nongnu.org; Tue, 16 May 2023 03:25:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1pyp3s-0007aK-7u
 for qemu-arm@nongnu.org; Tue, 16 May 2023 03:25:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f4449fa085so47479015e9.0
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20221208.gappssmtp.com; s=20221208; t=1684221930; x=1686813930; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWOCyyIV2btvZAvfYFkoh+ctTip8VAimAdpfAKKDpYA=;
 b=sR6sKjFCvhO1mE5oa7stZYAnUJmKnnMzl8M97hoUXfjOgLH/h8ktWSKnHvO0xi6MZj
 0plDmWgCvLzThRH0to8qu0H8jVmxXg1tpd07dhLfcCy2rQI6/UHCGV3NR672pSxKHcRI
 LQl+fJE4x9+yjpkXmom0GI9lAFPPelezGtJuFswtS/Zb+7jGKPlhtECBeURkVsdoOc1s
 Cz1fha58GfarlcbYHecGYHcqU5Fzugxoqqk6jJ5twL5qUCdwUJvUF+yYBf/Y4tAYcqnA
 xoJBXS+vhPFrwKhcykTQGeWgaDn7dbS02/9MCrYhNLySNXgdBDwX+kP0yVv5ZcEBUMfv
 4P7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684221930; x=1686813930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWOCyyIV2btvZAvfYFkoh+ctTip8VAimAdpfAKKDpYA=;
 b=SZZpT/eBWHbfQRVYQSnF/Rp1jp1mwCM5t0JijSqMRRqv6zM/5RtKSOS00eFuvwMJx6
 1j5hPG9VjCfjj3y31MAMehD+57e1jMWQzo70lIg00d1jDOsMRMLjztu6XgYhaEOVG8uK
 a655GLM7CaSkNzS+yyOI4wBuw3Zcq1t6W1J5KNiIFu2uo1AeD0sIeGl/HdkC5it3IHF3
 1J6NJvKpN24/BlhEjv6ux1FZWw2qmQgL02AvBN8aotodkuJMq+2Oq1/Tt3zIlIohlhoK
 JcISmZytkmnzrxIm10r1S+DeDE3ZvporogQFu/orLT888LtCmH6MZzdm+vAccoX8dy0K
 ACoA==
X-Gm-Message-State: AC+VfDy+qXPK9h4ls5814+cngYef0bfyCv+Df9A0v4Dnx0xsl8YnB+qF
 oYlEAXaYQssUC0F+5ZgzvLPBr0d4hnGSH9ROe5p3RA==
X-Received: by 2002:adf:fe05:0:b0:306:f6c:1063 with SMTP id
 n5-20020adffe05000000b003060f6c1063mr25557630wrr.38.1684221929969; Tue, 16
 May 2023 00:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230515203311.2139-1-eric.devolder@oracle.com>
 <20230515203311.2139-2-eric.devolder@oracle.com>
In-Reply-To: <20230515203311.2139-2-eric.devolder@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 16 May 2023 12:55:18 +0530
Message-ID: <CAARzgwzJRbcUnHspiUMO7qNUp6ypwxMJxxJ_RXRHKzN6BY2q_Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ACPI: bios-tables-test.c step 2 (allowed-diff entries)
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, mst@redhat.com, 
 imammedo@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org, 
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, richard.henderson@linaro.org, 
 eduardo@habkost.net, boris.ostrovsky@oracle.com, miguel.luis@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::32e;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VMHU0aUpwxHM

On Tue, May 16, 2023 at 2:03=E2=80=AFAM Eric DeVolder <eric.devolder@oracle=
.com> wrote:
>
> Following the guidelines in tests/qtest/bios-tables-test.c,
> set up bios-tables-test-allowed-diff.h to exclude the
> imminent changes to the APIC tables, per step 2.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Acked-by: Ani Sinha <anisinha@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index dfb8523c8b..1e5e354ecf 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,5 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/pc/APIC",
> +"tests/data/acpi/q35/APIC",
> +"tests/data/acpi/microvm/APIC",
> +"tests/data/acpi/virt/APIC",
> --
> 2.31.1
>
