Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp684339ejf;
        Fri, 23 Feb 2024 08:53:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXeui5O2DGQqH0geLOBmUx4mcmd0+dnQtz0nrYzB+hlUZAPjIqriK7bl0Y+ZVF/oGnDfhQaY9sxxe7DGGvGTg3JxmIXkaqn
X-Google-Smtp-Source: AGHT+IHStLyTVqIs44e4dgcWw2mxrk6xK8G5du1YuuoeQGOCEfwzA9SsCbwT1xcy5pSVMnLNwzBS
X-Received: by 2002:a9d:6c43:0:b0:6e1:13a2:3948 with SMTP id g3-20020a9d6c43000000b006e113a23948mr359752otq.5.1708707229132;
        Fri, 23 Feb 2024 08:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707229; cv=none;
        d=google.com; s=arc-20160816;
        b=rtILN53+oZLIOsiRJKGYnzEuPwMCaWAaiC/bDKAxn94dSswti3R8RZwaut6KHH1BiT
         YEwcoXyPEa0tXnSWblS7dr93li+HirvIQGm/Ewpal4lQlLjUg8CbG6MfdfUkZvdF+uNI
         YAgZg0hMU+P49Ns79CM05Ef5c3zTTZ/fo7L7UVPaIlqPqDE8WK69J33lIA2FcooECSGQ
         Skha2J878/LngDM4ceGda4f1eHqeXzcGKDy7xoCojCWzqUtBTfcgSTTBXuAPQyknk/GH
         TMw5odAamTLzjDLl1B99rNYRT8rs1zEKHwRaaJFFwahUgqA4XWFjdwzSaRdbCbhhevsw
         HqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gbDuLMC+h941sbR5rr+vKCnvv/J26lTcKlZI0jpKbJA=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=cxTjVf1q8st9g6CwnygLgTHgHSmed1iX/7Yvz8Sy4kzTv5OQUGklIw43kzeDB8rfnY
         yg2/p6I5txbIpPFHigaFLkKiTmmRfeReJiL1XwAc4qQwVIJpvt2DaKVssV7U6OZ/TyKX
         5hP3cPMhUiUyI6SFAH6FfyBJv/0c07KaYhIadJbSve0jNdX2aUbQnwV+AOWiYWopteQ4
         5XRte9aFSdWj0Bhj7Abqmwd1N83aQLRrKfdnsVCz5Gxbq6z+h+Rcrk19PwSIwhwfmb9E
         EA+hbTK/sJXDyPVwXunPMby4+lxrCEfAsHwvuDBFJmxAduvBVkbwjzsox1E5620bH1Pe
         isDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IRUNvu+v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020ac87602000000b0042c36f44980si14611209qtq.427.2024.02.23.08.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 08:53:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IRUNvu+v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdYmx-0006PW-Qb; Fri, 23 Feb 2024 11:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYY3-0002lT-14
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:37:21 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYY1-0000Fg-B2
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:37:18 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-564a53b8133so714270a12.0
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 08:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706235; x=1709311035; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gbDuLMC+h941sbR5rr+vKCnvv/J26lTcKlZI0jpKbJA=;
 b=IRUNvu+v9mOJy+jPFZtaxkVcccvbAzhL6m/mc/Dyh1UsrmlyplKeNypX3QRT9A98p/
 2IbuJPxDuYXGyU7ZGzQBZO/59lDfEa/+/mmrV9GOR3rvURrppCyQNbhWVixbdrOuH66A
 ZLboWJ8L3vjZeKL61vh/B5SfsMiNfMAQzxcVbCRro4NAWmRA2oH9WwzEZGPA/cvXOEoi
 2N3t8WaDMDVoVgdQOVX286MUKIybm8pVULLrufH8eNYT1UQ4dYII4Rd4y7vS9Lj8gUEY
 KPq/fwdLu0UuCkxIuO4TpeLuxFgy1pAJYa2Fdcgdyxh69knGeP+rio+iizmz0dG/XfyG
 0Vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706235; x=1709311035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gbDuLMC+h941sbR5rr+vKCnvv/J26lTcKlZI0jpKbJA=;
 b=aoisYLxq6ZpduG/1Eobx35KxQekGZJZwbUb7Ms6Vw/WoEziO2IQsfh2qR84ywSK9z9
 LoXaLWjHcDN/R04URJRPngn9/nxu2qGIi/Lc9i3r5/ubg4DXUIIacJ6KcPYIFNlj227b
 pgauXR7epmvbe6hUtagbUO+68rhAn6aTMfDISn66lGUBxR2BWyVVtoves2G68uzjfP7V
 uLff1K7MaGRBZstgUnu920i6Tq6zbtHvZDMNWISGvvu/8ao5rL7BUFnY71jSX0LeUuJL
 KYJOk2evruE56Khn1OXQ1S5UYixm2usGcEn9Qaa2EPvms7v88xS+qlQ+msTtlQLF3sES
 Hm6w==
X-Gm-Message-State: AOJu0YyugC417aGeExfL8o5ThtMmzMn9dgv2zhViOgNmjfltpE4fvX/i
 e3sv8Vxrw0WjcwI53kBUN1onazUu5068dHVFFuZyUZxhMDvG8w6qiHaVXAx9FmaRVmHVSFdoc/q
 kcgUdUbH8L3by2sK4b/LIDHY3CSewH/jCxLAEDw==
X-Received: by 2002:a05:6402:3411:b0:564:7350:cac8 with SMTP id
 k17-20020a056402341100b005647350cac8mr268230edc.15.1708706235607; Fri, 23 Feb
 2024 08:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-2-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-2-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:37:04 +0000
Message-ID: <CAFEAcA8kOKhd=BH9m8kWFsaJ2NQHOdfwg+9JnCHDNDsni58tiQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/41] Split out common part of BCM283X classes
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: IVJ14StejHDG

On Mon, 19 Feb 2024 at 01:18, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Pre setup for BCM2838 introduction
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
