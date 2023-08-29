Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3691053ejc;
        Tue, 29 Aug 2023 07:09:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCe0CYZjV5iJxIwbjNRKDndrceYMxW8JU+N2+VLs90uRPo5FJHQKOnAUtIhN7z+ljjnAqZ
X-Received: by 2002:a05:620a:1232:b0:76c:96e9:7d5 with SMTP id v18-20020a05620a123200b0076c96e907d5mr28188609qkj.26.1693318153700;
        Tue, 29 Aug 2023 07:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693318153; cv=none;
        d=google.com; s=arc-20160816;
        b=DmLb/CHHgMcKF0/+36LREzXPAtOvU3u2cIJQOsyu2OOKemf1SpxRQHg12F2AAn9tm+
         AznVZsBBcIy3QxUXXE0MjlTBJ62QNRQNAHamrAGQglWeNewe4YH0bWgWQI+gjyyCQHBV
         CPjyal6kEd/UFXieAyH8amFp2bc6vs2ehaZfnKcRYTmoIXx4hOE22bluw3j4rs2JnXzy
         4GR2IEcWq01iCt0467j5/GAErVqctlqnDLn4W/eKSMisz/vWxrsNa7bUquhvI3PypYCb
         1xS32UUM74h2fd5Fvs5F5lyaFCX1ZuXvAfwWGRfWpsHlGKFKknmoiHzmlbvYnDNauhfJ
         j5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FPKJXzcH+N2qfZUCo88vGLiMpG2dypyl4l+05+TWiXY=;
        fh=KN15t2ypiO1BgVdQTfcSGbN7T6gS88c/uIatLiZkeQQ=;
        b=I6y1aFNk4QN5iVFFFzI/Lcl/qw9DwuKYAoapfW6taqJeLRxdTsY6GKILYIWWyGBGjc
         DrTPka3YgEeqDNsXRubPskGJChzVi7b6VoheTApT2SIaHNOqJZiGsJxE3Gio+te50sIm
         zvMcJBLk4HfzJi8XovkKpYAG2LrSHHO2DzVSQ0L+U85R27GzP/sG8iNuVmGqqHi8J03u
         QgNd5O4faeycBXH8uMm+4oCb/LXEAJllDzGeDWfxjn/6RZr0McuSDjuk2r75g188VnwQ
         CaaZuPCgRmJh7C68ifeTEx6k+jHmhDJ/BtYJO17/rRYtsnOPqX1T070BnePzfqU6SIT0
         NHmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rEIzw3lJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05620a449600b0076d8dff9b96si6335866qkp.734.2023.08.29.07.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 07:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rEIzw3lJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qazOv-0003tT-Av; Tue, 29 Aug 2023 10:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qazOk-0003sM-OD
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 10:08:54 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qazOh-0006OO-A3
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 10:08:50 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4cbso1239810a12.1
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693318125; x=1693922925;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FPKJXzcH+N2qfZUCo88vGLiMpG2dypyl4l+05+TWiXY=;
 b=rEIzw3lJzY0ZMCg023DEucM5996RPKrmljRSqcpOVRks/+R87gM/QYFiLtkT7SIAPy
 7gVNLN+ok3CueU09WokbJc0VDQn0KQ50ZWvpMYf7LLlZNUfFK5F40JWkefcyLJbYvWYB
 QSgwLeGnx0aYABiD4pvxF17x4pQbGRUaWKXG6QR7zNoedbqVT5bmJF0VGxewM17+wylx
 hsa4rF7H4LDj5WPWUpgxK3bUWNvcrRc6las3z3GQlbGopOowilTyXwz3rDIB+TX1zDSJ
 5sr2M8v0g0w8HKeO4dixCqVcLXyXKO0vwm5evWtGN6fOEA2jAyIc/3YwiqlycN7LxyVK
 1hCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693318125; x=1693922925;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FPKJXzcH+N2qfZUCo88vGLiMpG2dypyl4l+05+TWiXY=;
 b=ldPb1GUQQ9d5+eX21q4LyAtf4XW8SBIg7tXOoqHNHzImimV2VAzKAPRZx1eNcb6lUN
 ggiFp0N6H800O97sJ+33QkBgOhg44VEsBjv8izreH7zb2hDKjxid6mBsESxQ+xUBrP0H
 KQLYtU8IbsxLlG/E51HoJs7rfeJnzyE6gc7cbXZCdu4/TZHcZhLQ+eH0NCvWGL684Ks7
 oexIMB7GJ7aKKa6C2mcA4r/xp2q8hQTEiys4wGDcPu2uaEtifLjoNmxHLrwNhwY4ze8t
 vtgKA115Lvz2xGkhOrow9f+Wi7U9Gkqnt1uyTLfygBFkkswSNRW3ZRZ62MtT+XrMwuu8
 ZiVw==
X-Gm-Message-State: AOJu0YwzGZPEyPEP22nFDI2BalpEfd8cFUTBrkioCEDoO5ZlkLY1K/Ja
 IPVPYiInQ2PWcIYz9milH28vzqKOlP6DzeKyc0NLIQ==
X-Received: by 2002:a05:6402:202a:b0:52a:47af:97a4 with SMTP id
 ay10-20020a056402202a00b0052a47af97a4mr12290529edb.5.1693318125385; Tue, 29
 Aug 2023 07:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692964891.git.jcd@tribudubois.net>
In-Reply-To: <cover.1692964891.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 15:08:34 +0100
Message-ID: <CAFEAcA8_rL8pGbr_imDL2vX=UkphL9d1PXbWZN5Xmor9+Xtthg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Complete i.MX6UL and i.MX7 processor for bare
 metal application.
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rPb7lvnmgPDp

On Fri, 25 Aug 2023 at 13:21, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> This patch adds a few unimplemented TZ devices (TZASC and CSU) to
> i.MX6UL and i.MX7 processors to avoid bare metal application to
> experiment "bus error" when acccessing these devices.
>
> It also adds some internal memory segments (OCRAM) to the i.MX7 to
> allow bare metal application to use them.
>
> Last, it adds the SRC device to the i.MX7 processor to allow bare
> metal application to start the secondary Cortex-A7 core.
>
> Note: When running Linux inside Qemu, the secondary core is started
> by calling PSCI API and Qemu is emulating PSCI without needing access
> to the SRC device. This is why Linux is using the 2 cores in Qemu
> even if the SRC is not implemented. This is not the case when running
> bare metal application (like u-boot itself) that do not rely on the
> PSCI service being available.



Applied to target-arm.next, thanks.

-- PMM
