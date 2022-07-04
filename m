Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3247395lft;
        Mon, 4 Jul 2022 06:58:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tNg7mEssjjTodWfPGklfny5deJsdgp8awjodAaD0M5b0THRnMr38+XHGZA4KzdbsUfEFC2
X-Received: by 2002:a05:620a:4086:b0:6b1:e044:3f66 with SMTP id f6-20020a05620a408600b006b1e0443f66mr17514267qko.500.1656943139412;
        Mon, 04 Jul 2022 06:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943139; cv=none;
        d=google.com; s=arc-20160816;
        b=OIC00wlOHhLYrGKbIqQb82fYFd0/BEnGLTJcYvp4GSAXt7qi1F0QPK/7ivQlaC42mx
         kRIbhXs9SOkxg9tVlmykvat5s3TNYcFL/4N2JIThm7xjieqBqo9ynR9GRSHZbyLIxwA9
         Z4wlxJsQSI+kr4TEe5iRe86LEYwXzNvjhvLQfYZDimbKlqwl0p8PwzB6xhyLvuje0qY2
         0OuSVhSb+uywthF1mxVNX/XHI+mv1XhklNfxcLP6aNGJlcJ7yPnnAGFQ31AP1VcMWIIO
         4v/Y4mqzjJlBSfKz8rh/ZsOFwG73TuLIy3ikKTIbIEueaXsPXQ9GUJ2euQS38MQ71TSM
         A5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ahtmvwQz/25Q3A+1wWSKkBPOCCQ0CC/WO5WGn91gpL4=;
        b=ql1izGRBqGvT52PTCazfK6CquJZ8ovnzVXmMShdGePbAMyUW1/T5pX5yhOkqqbZBjz
         yMahdfatrtbddqDe5ipTKViqLs+DucGT+Q82ZlZaFasuKuFYw0maN7WGF6xFEoklWQUd
         wnm+xXJYWbA2JdunHqk+YSfvKgOQmWMu+VprRG2+kXNlG9fe12ynTJdUbNGEHXiE/+ee
         RU8sI+K72KpTUdwPQih3u0emuaIAMntXJunM0Y4YWqO6q6D+hTsxUuKpxEoqHUyF5/nm
         C605U+QNuEL+OVYEzl1F0Ir/NDrBdBpA02qkgpunBNck8Kq+Q9dF5NrErQmU9FgWtWu5
         ghMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RHC8GGD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr6-20020a0562142a8600b0046b91d1a174si17260165qvb.348.2022.07.04.06.58.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:58:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RHC8GGD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MbK-0000fI-Sm
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M2W-0007LA-LF
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:23:00 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M2U-000333-Te
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:23:00 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31cb2c649f7so7638907b3.11
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahtmvwQz/25Q3A+1wWSKkBPOCCQ0CC/WO5WGn91gpL4=;
 b=RHC8GGD1E4nF1lpaKeSK92zyEYOC904gLVaePRG0zlPXctn2Zmsc5Q9II6haQFR74R
 4L5kepU+Z3TghcTMl1fSbjZ1f63pBh3zp7soh79adI5kADD5FXq7fzvO7GZ8mftpCcBW
 bblSMIKeX6inVu6uT8+K7i1cI/TbiKk+RkOtXOBsO6WGlWngFMXIm2mGpDqIn4NHE7+v
 M5U4rmaZbeHf8HYVFwFyvGoS8EwGzQvfXP2K3mjsO5ESRtCqXKMI/PPtWM2pTD4FKNgU
 Hi6CIkf8VgM0GucARgV0rFitgSOTsyMRIn1HkFP4GDlmQblbwJhR6bujxw6pSs6yZ97Z
 DH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahtmvwQz/25Q3A+1wWSKkBPOCCQ0CC/WO5WGn91gpL4=;
 b=ZuqZ/5kM+yuRfFIHCQM8qOQwKdbUZqyu5/IHvYIk+921AlhHvTz+ZTTZWDilSs2lXU
 9jPeVHyYKJ3pAhpufe5bmEMA6RSpQM7XCmr7SYVxIQEFv9Q5MJ+R9SaSNJHq06/JIXY+
 H1K2BeWW+WHZUUpd/4SHvK4LZyzEMLP4PCSy+M8JLEbJ8QynQoudFmEwGwQaJAp/i0mm
 axKRobsiEVfGYxwItVZgZDeZmyrb/x8mynCa4eqykHwU1t/C0xSbAHpKwytvE1eirnG6
 ilkscKQls/J9MNayfxy/dqaLUyvQ28yv79RBOj/GXMaWop711Ln2CG6EC+FmUPIzY3tO
 X/Gw==
X-Gm-Message-State: AJIora8Q2nA1a0vkqKro+t0iB8abytHoymL6DF3VBYEf9eDe8FH5pWiT
 NVXrI1tad5WmUQxTeqRnOkcCAylKlV9xoNV3QHr+xw==
X-Received: by 2002:a0d:ca4b:0:b0:31b:7e6a:b77a with SMTP id
 m72-20020a0dca4b000000b0031b7e6ab77amr34129396ywd.347.1656940978329; Mon, 04
 Jul 2022 06:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-18-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-18-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:22:47 +0100
Message-ID: <CAFEAcA81LupX9QP0vH8P44r2AnRKLihfoq5s8hNNz6iU_fWByw@mail.gmail.com>
Subject: Re: [PATCH 17/40] lasips2: introduce new LASIPS2_KBD_PORT QOM type
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m7vZcJIKhgQf

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This will be soon be used to hold the underlying PS2_KBD_DEVICE object.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
