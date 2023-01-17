Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2388256ejc;
        Tue, 17 Jan 2023 05:49:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt9jv0VHorob23mbA0VU9AwfKF7SRXvcXD4Krlc+OuMqBWv+HaMOr+d5M4Mh6b1s+duzS5B
X-Received: by 2002:ad4:498a:0:b0:534:723d:fe72 with SMTP id u10-20020ad4498a000000b00534723dfe72mr4770638qvx.6.1673963395190;
        Tue, 17 Jan 2023 05:49:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673963395; cv=none;
        d=google.com; s=arc-20160816;
        b=CwHgY1v8bCKwOofzK5PCHqaPdonMTkwYxyW4p1BUUbQP7Do7reRb+F4WDGZFmlFLoa
         lzys9Rpo/pMmuCtaLvWfBQj1vNYi7DjpU2bZhPLwpcxMwQnOxlwDJBcD4PpBK8v3BPe7
         KD10IDCTcoNEf6xpm6xTOARu0vyQfNca0jgOejYvAlXGqnGOVCsg6YGmbXelwHaShFCN
         Nz8CTIMLlgatvdDMjVwyiI+7RgxBBvxeLjB8fGbjhOhkWUbB35kv2UVnDOMgNd2L2nTv
         3RQE528qq9EBHPc7OZvaWxpa/67GwgWywBdcuAQ3l2/fi4Fz1UJ59CUk688P/NnhLy8C
         xImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=K8anxIq5hgvxPMQKsdn153nvHji6oJ6b2PwG1YXky2M=;
        b=LV7F9bZiZZZlexSmjcoiGn4T2O7fLdEs69tqtpPl0zGdB0j7/3Eiu14EJAokQJC16K
         rGxEwUkE0hP/XuOxLwa1dYsbfCK1mv1fKrQHWoKp4306pFLZyHez8B6hDnmb4/kSLGNn
         KwxT9btEoRBox9CKSK2FFjhKCw+TL4bFSl7HUoo6gw5K+klb/mhVfnJD+yd3lNvdo0qQ
         2Lt9S1eQsZvql8b+fTLFbZY7qWW64P2NIOwCq7aHMPKWpcs6V7judQKJD1+A5A2N7Prs
         LzrYZFnpqqwh2/B44c6vJFYa5EQwJ8Cw/mSpXSspa0nqb7oLer5zSskqnfNl92af+3BP
         vzUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGvSmg2P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14-20020a0562141cce00b00531e544b38fsi17653155qvd.214.2023.01.17.05.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 05:49:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGvSmg2P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmLG-0006Yi-JR; Tue, 17 Jan 2023 08:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmLE-0006Xk-O1
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:49:33 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmLC-0005JU-GW
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:49:32 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 cx21-20020a17090afd9500b00228f2ecc6dbso8993578pjb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 05:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K8anxIq5hgvxPMQKsdn153nvHji6oJ6b2PwG1YXky2M=;
 b=aGvSmg2PaZz8BvzUOlic/7ywzi9y9Tna3JrheajOfghlO/f6EoSStsSGpsTnDpEsvm
 as/aXZhOUDbSWaDCcQ6Z/FGtllls73MS4WpeN5XsuGX6cq+IcVDVzX9Tq571+Sekw+D3
 pQptZ4M/rS4oGQbQdmFfgYLHrruK233kn/FUwQMxgGWTOz4PbXxboro2U7z/jC0Gzk0m
 rD8CXV1aiLJ2QzKAjOuyub8b6MVtMdAqKeKi9B7cPsMI4a5VHwKNVNK5GMzC6NJvNeWK
 Ic2eRHrwZv/LN4smEtG9QMWsZA/maLKeGvRZTNfjJBczYEYWkKURFmmo9YlqotLCXpJF
 UdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K8anxIq5hgvxPMQKsdn153nvHji6oJ6b2PwG1YXky2M=;
 b=nri90LhOFsvFXqNCPrvHK0TYo3jXpJEeSYRfoOQbsZ1LN4WCNZhKni+WwTPH+sQT0V
 kgMkHEhsXa3z77u4RrrqG7u6YtG14ddpT2qQ75DfN36o09+aY95MDxeuphYty14XxwjB
 DlZvWqkiEFvwoqPS31U02SFudANe7YChSVYa8O0NOpqsR/PKSaFzQT9onkUZ52QFTd1P
 FvUABd5NizMjIUVsxRpC2q3Gt4zhJ4mFnFjXeYKsftg4mjQZY8uLACc2nxctYss59wnk
 42pXVro7o3OJR9g4CGbpi+MXUBI7+viEwpZ1jnfK5ZDe6pIji04UXarmf5MaAM8wohpU
 axbw==
X-Gm-Message-State: AFqh2kq8mdd00/O8hUbJHAn7nNXt+F9siRzNXpCfLYtB3S+7GgcKzwt4
 r7Ftq+sGKZSRpLtMIwAuz1uz007HpOEv67cWt+AIhQnGFEYBfg==
X-Received: by 2002:a17:902:7045:b0:194:957b:e80a with SMTP id
 h5-20020a170902704500b00194957be80amr237243plt.90.1673963368938; Tue, 17 Jan
 2023 05:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20230111085016.44551-1-philmd@linaro.org>
 <86fc15b7-6880-b628-c9c6-c4cc1d602eeb@vivier.eu>
In-Reply-To: <86fc15b7-6880-b628-c9c6-c4cc1d602eeb@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 13:49:17 +0000
Message-ID: <CAFEAcA-vfE7b0qCZn1tDLK-dQRNTpUiwaWXBy2JOY5XMLTQMBQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/i2c/bitbang_i2c: Housekeeping
To: Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Jan Kiszka <jan.kiszka@web.de>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oDzav99J6Rtr

On Mon, 16 Jan 2023 at 17:30, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 11/01/2023 =C3=A0 09:50, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit :
> > Series fully reviewed.
> >
> > Since v2:
> > - Use array of const pointers to const (Richard)
> >
> > Since v1:
> > - Fixed overwritten RECEIVING_BIT7 entry (Richard)
> > - Picked R-b tags
> >
> > - Remove unused dummy MemoryRegion
> > - Convert DPRINTF() to using trace events
> >
> > (series used as base for follow-up, better if merged via ARM tree)
>
> I can take this via trivial, what do you prefer?

I'm putting together a target-arm pullreq, so I'll take this.

thanks
-- PMM
