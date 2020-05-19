Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3870505lfb;
        Tue, 19 May 2020 02:48:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC5hhG9zCD2Sh4O73iQh46Qoh5MMf35GMYHFL2vAvjS6fTH7XAqwxs5bGmMNV962u0qdif
X-Received: by 2002:ad4:4aa3:: with SMTP id i3mr20351361qvx.28.1589881737684;
        Tue, 19 May 2020 02:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589881737; cv=none;
        d=google.com; s=arc-20160816;
        b=T4XD818XXT+Z36vNMNH2lJL/8xNL/xBeZYIYAydt3YoUqSIYk315iDRjc6ib9rnXfk
         qzeCvU0t+9ATXOM1DJ2U1xOlOU6VQGVa+QzgIwUmZfWMaGbhIeikQuOSC1zigJWW0MWv
         cS1/PrwQmPqWLwtxH4Z4q2yu+Qe8BeyhOy2tcycIIaCfZnqSeyThizmeADQRJv13ahOL
         IR98it3SwufGHSMatKtu+8zr4Ladr7I9LV12+WYOAL6dT5wTpwHT9bsKvhJNF/Izt1y5
         tsgaL37fzw2R/0O1MVOKIzSv7j7MPhjC/h5Sjs9TJw/Vm0aIbUvgxhI1m0lIicjg/0yC
         n5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ak2H7rB/DvgHdGwou1WvaV9Jt0pud1tPDPyoqj484WU=;
        b=jdt22iPjxJgBDNVIj35vj8VsH3ze57o+BhM6SLQPvINv2ztLiefa37nKLNxlk268JX
         p16xhFgQyGZ5vNlmb074NmDm2ALQKMj2/iv6dkDmBzatKJR6vRNBAQ+NzqneGRxFE9KM
         e4wMLwTSbCLs4LgXK49TA8EA58A2O7Oyx9C2R7OrZt5PvOuk5S58SVGe8O+Hzv0jQLLm
         pysjGuQwT3coJjhAxX8gZBC74rM5XbGvv18rPhODZgAxwZlx6hJtA9zMmOQYbxPV6gha
         RL/5nA/LV4hQ1syXGktHO5hCYzaRRo90g6Yoxw5JnbR2uawUG0p4WMUqM7RzM+aaOkfn
         QU2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZoR+grii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si7250014qks.154.2020.05.19.02.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 02:48:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZoR+grii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jayrp-0000Bm-3Q
	for alex.bennee@linaro.org; Tue, 19 May 2020 05:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jayrV-00007o-Fb
 for qemu-arm@nongnu.org; Tue, 19 May 2020 05:48:37 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jayrU-0001gj-IN
 for qemu-arm@nongnu.org; Tue, 19 May 2020 05:48:37 -0400
Received: by mail-ot1-x341.google.com with SMTP id v17so10644884ote.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2020 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ak2H7rB/DvgHdGwou1WvaV9Jt0pud1tPDPyoqj484WU=;
 b=ZoR+griibeFsv/ylck1g290gkBjicjwztH30AQbKgEz+UWFKvUaAl2lMVoPo69TvBj
 8BLcO9aSgCmdwY6pIcNaI9WK293sBpcDRNzfn7jRc3MxtAow6R0CVmNroDNEfhEl3TKF
 cVeQAosox5SdznwMY68ERNJyH9qIWG9kUOqqKSd+fFNFXlEyaRAN+vTZAy2KeOmYi5d1
 I5ORxyIGl8X+rZ+bnkvp1uz/yRUs7WVIgfcskY7rF0ttXWPB0iWngwNbowgxjho232Tu
 oTEhO4kSwBsZ2C0uyg99wW7E++x052rDT5h940+HwzuQiSQObnDGGF0BkzcKxUIVQIdH
 TcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ak2H7rB/DvgHdGwou1WvaV9Jt0pud1tPDPyoqj484WU=;
 b=mHjao0zpJnGMfKCuAQYKKJnkQdRUQhstwRX+Ru+8xt/wMvr23hwdfxubXsmgj4Pqam
 Fw7r/vkx/9P0bMpcIJ0OhgfhoRD486CzD6BM26T51bK4tF9RZM6WPJTcQqPTm3GqT6fO
 l3SHBH66cH9yX5xHIDvULAMuXOy2BS4W6VbCcUEINjL0Frca5f9+du61uMEhnCfLkb9N
 41DoB7TtZwkdMzN/3xz3zT1e5GrzP9IIn0lU6ZQTFqFrys4BXVVjqO/F5pwwhG7MBcGH
 vJpLTeE+ci6rhIch8C84tTyZYPcvl0tPBQ4RFI+rQg5fR8eQ2t8xy+QrIMF12cy4AT5e
 JbgQ==
X-Gm-Message-State: AOAM533rWSzgFpXf/aD97Fk+kbbhB/x31u2i6xkaDLUMjLwc68+Z8CRu
 Juui1FenLpIFOEWKjS9chDjlfBwl5EL+nF96qoMwHA==
X-Received: by 2002:a9d:3623:: with SMTP id w32mr13573014otb.91.1589881714921; 
 Tue, 19 May 2020 02:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-3-armbru@redhat.com>
 <d6b1e66a-23be-e38f-1140-9b45618741e7@adacore.com>
 <878sho7bor.fsf@dusky.pond.sub.org>
In-Reply-To: <878sho7bor.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 May 2020 10:48:24 +0100
Message-ID: <CAFEAcA9tVM7RhgUyjOAfc18Ti=Z_yk-BhL7r070aqkxsPPBwcg@mail.gmail.com>
Subject: Re: [PATCH 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fred Konrad <konrad@adacore.com>,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HyJE/oFlXUqH

On Tue, 19 May 2020 at 06:09, Markus Armbruster <armbru@redhat.com> wrote:
> I figure the "device becomes real only on realize" thing is actually
> more myth than thing.

It's not a myth, it's an API guarantee thing. If you don't realize
the device you create before you use it then you're in the world of
unspecified behaviour, and anything could happen: maybe it works,
maybe it doesn't, maybe it works today and breaks tomorrow.

thanks
-- PMM
