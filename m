Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1451590lfq;
        Thu, 10 Sep 2020 09:17:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVPdfQScVqq0RWMnLTkW3UdwUaV5Aip1ORL0s91QTVzADBa5JDQeJVDNwAV1xBgxyBsBPN
X-Received: by 2002:a25:730c:: with SMTP id o12mr14589341ybc.512.1599754668095;
        Thu, 10 Sep 2020 09:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599754668; cv=none;
        d=google.com; s=arc-20160816;
        b=aMSlUz2/piUBaScsWINFILKMLbeodvtmqzgRk4ujnEFMTfsPnCCUaiOdnUpK5uLrGE
         4iuDlLzXrXNHHBFgz3rnSE1vceXGSWjHRtMpxtt19MWCPdZhtHyFLxUSA+KTa0kefEfM
         qd3zsjuw5btIHLEjhWBp/IlcTKfi7OztBZ5BnbERCJb8MYSRLp7aMuKa2hyKy+zAkDL/
         NstVyrEs5PF50neo/VfNZhijr2gSXvxUxix5Xec7CcM9BSfGAZ8P4NlPQ0gXxnlnPgk1
         dPP4VyNVSRQ9DL2Qo8+lrxDDkTLEO0ZVuO54kQ4pcPRwcj9/valsK0vmZHvzEFlLgb9W
         iEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d1zXZOEgjCvDqH4TQTfV6VGTaNJ2HtR22eSSv5aQpQI=;
        b=wEP3F6rAAORN22QK3fCjtzqtJ0UO4YnfC9llLJvF78uIFN6nKkNFaVvf/5EoibDuk9
         mkv0BJ3fCefwJXpYHTCJVRJ28YXwja2L41IWzMeJtCD21ibl4/BR/0Q2FwneEKAmBJ1r
         PCpKp0RBsvwqmAECtNQj9k/sjM5IsFaSrkYQMEMK4wZPLSt4n5oPMszyKdtBgRcDjVTf
         Jw58SogJ5zQqd+1JkZsaxkj3bVh64ncImqgVA+x4jLqCo6qaE5zu5fqJX7d1D/w+LHtm
         2xeWQOmnDnT2+t+dUTUVCIWuSOR9yAYkIXhaeJIeZPpRHVW+r+rBeOY/dBQMixUVwygj
         BCUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ey9ydOUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l194si5420271ybf.176.2020.09.10.09.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 09:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ey9ydOUe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGPGd-0001D9-Fn
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 12:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGPGP-0001BN-J9
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 12:17:33 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGPGM-00079y-PY
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 12:17:33 -0400
Received: by mail-ed1-x531.google.com with SMTP id ay8so6884696edb.8
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d1zXZOEgjCvDqH4TQTfV6VGTaNJ2HtR22eSSv5aQpQI=;
 b=ey9ydOUeMz6AnjSZymN2hY/+r4tmd0diLawBfjwdFXVYz3anLyOdzd2kSRhqC63nTX
 SaCSr0qklDWHfwyvyi036fQ6G9atqBFN+PNEvvo/+lSKYONNa0VmB1gkqGhbljztujE1
 RvEL+k7RieKlVcT7+g6AxWO/mSn5N9xsobPOAh4ThxXDXgqJPTw+eQ3pdBzuE+mqTIBy
 /7l3fZijyWfTs6HGZEPb3BO4k4FL9GEuOKuNfbIyw4tZvltduV2I8AFF6GVmzqjfWo/4
 4SaVXdsnM292LRtep5ZPIPUvA/6nd1fVNGSElCC/H9V5SzWI7NBXrJXaVfvNgOyPPYMH
 YSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1zXZOEgjCvDqH4TQTfV6VGTaNJ2HtR22eSSv5aQpQI=;
 b=HXXywb85LCY8t+nsOSe2m3JB8JV1zfKPNJdgC3DLfmR9qW+ZwxCvJg55Wnpgw3pQAi
 bI2F/msTlATLcaG80xQ34Edylr81p0XkEXlG0rBw9mfHY1cSSsVzVOMU8hWpcoROmaQD
 GYLjh1ItpK9CYbnQQlUEEeJcBu0vjhnivVG+01xD1WnHT2eatY6NKKAn+7fukKjXb8ET
 +bPHsv9Uap1LF4mP3ZQZUJRSB8sFLQOO9j0CFaHsMjNjbP1upB4AII7i3XSWq9hn5j/S
 h17dfCSN16DL6/gLkbrWapwivZRicQ3CnlCDwgRVBs2RgKfukp6jSJOP5v2plZ6WNB6I
 HqaA==
X-Gm-Message-State: AOAM531VSC5L+c22yB3a6OyzyIigebdsiTYIiexvx1xV3jqMuVJbiod6
 MhX2A1eJxts/tBtAhij34aBVyQWZXns9k1IkkaNYrg==
X-Received: by 2002:a50:f28b:: with SMTP id f11mr9948499edm.44.1599754649067; 
 Thu, 10 Sep 2020 09:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoBWHwtE+HWkoj3a2pdYHOkPpG7ya=+-RRFvUp-SXwuTWvm5g@mail.gmail.com>
In-Reply-To: <CAJoBWHwtE+HWkoj3a2pdYHOkPpG7ya=+-RRFvUp-SXwuTWvm5g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Sep 2020 17:17:17 +0100
Message-ID: <CAFEAcA8spQVin2vj2V5DJYQCR_BizqrRneoRMKhqKAzFv8EiMg@mail.gmail.com>
Subject: Re: Master cannot execute MTE instructions
To: Derrick McKee <derrick.mckee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +9MhkXRdYq+8

On Thu, 10 Sep 2020 at 16:06, Derrick McKee <derrick.mckee@gmail.com> wrote:
>
> Hi,
>
> As of commit 9435a8b3dd35f1f926f1b9127e8a906217a5518a compiled with the default configuration, softmmu-aarch64 issues an illegal instruction fault when executing a memory tag instruction.  Below is a minimal code example that triggers the bug.

What QEMU command line are you using to run this?
In particular, MTE is not enabled by default, so you need
"-cpu max,mte=on" or similar, is not enabled for any
board except 'virt', and doesn't work with KVM, only TCG.

thanks
-- PMM
