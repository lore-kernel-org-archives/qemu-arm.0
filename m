Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1433942ejx;
        Tue, 27 Jun 2023 06:32:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4e2+oFthkv4GmpMbCRdEwhcCDUxBw1AeYs1HRTbkE8zULB1ob9CdUxUf9XmnroWEdqYzsS
X-Received: by 2002:a25:8204:0:b0:c1d:5199:8ec5 with SMTP id q4-20020a258204000000b00c1d51998ec5mr6236136ybk.60.1687872755008;
        Tue, 27 Jun 2023 06:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687872754; cv=none;
        d=google.com; s=arc-20160816;
        b=ZnapiLhW+j+lSyxVp3wu+bNC0m56AY2mnYZC5o7ajjwBgRPuTPiAB3TKsBZAeoqAe1
         mMKyBJ2pIt8JP4+t3rPYYQDaTyrT94Jbmxoxn6sD55/NefFVDbQYI7b05DtgJj3J2+MU
         OE6CewgAQlDgFdOxyUtyhPgco4/IFVkSa59tc7sibdPCCzKHXxhy4yiAu+B36m9JyPL0
         11qYJVPvY0twuBrWtLn3pb5lIMQQev0RvAymo+PvV57FjSh6nKc+272rA6L20z2cNBcn
         HhtMXzu/d2nRL9rQbRkD5EGUSukJD5P08h+xhaIZNIDHXHXfvgDX7X6yAhJfXHl+wk25
         5BBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=U7LZyYJQE3CVuFw/zJE963Jse2AszMk+Um/1z9JWh0Y=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=k/m8wnnQi946taDMv95IonKhX7FtLBODkbz2wKuLWgWfCmwh4hh48rAdiAYkbuwxyd
         NhmZ5ycfTcQDkzamR9hCx7SXvLP+Civ2VPAf4ltRKm2ZAFy1xRSnZleVfbKK++xJcCag
         YR9P74JVWbj9c7Ddc6sq7dt18Bvp7EP4P1iq/pEc2XscCUEtFW8HHG4rgu9N2en8cMd8
         jq+eD4FGb3NxeyJmkFf8Zt5OTvXaA0bVrrFXUm1Htn8pBR1KKzDvvfYEIS7q8soalk7E
         Bw2R6LeAdW47I+Yu/0SjJG0XA9WIH8R6VVsZW0D8zpMaLlDx4iFSy1vtDRo3avPwOxfq
         kbHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=TcUSBhQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a05621420a800b006236d96c8e3si3248802qvd.348.2023.06.27.06.32.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 06:32:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=TcUSBhQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qE8nW-0008Cy-NQ; Tue, 27 Jun 2023 09:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qE5Lj-0003cb-94
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 05:51:03 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qE5Le-0002rm-5Y
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 05:50:59 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-c13280dfb09so3339864276.2
 for <qemu-arm@nongnu.org>; Tue, 27 Jun 2023 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687859457; x=1690451457;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=U7LZyYJQE3CVuFw/zJE963Jse2AszMk+Um/1z9JWh0Y=;
 b=TcUSBhQ83sOfhbB7uXGznVjlPXX9eMUPHUlN2BQigCNmXYCM9rVzzjh/9Y9LLK/I1p
 HwMi9pZn4nPWnrVHTUAcbu7JX3+myky4fbHgJfEt+r7Cmy4AaEK2UNRjzD/NXCYYDSfq
 CjlMY77ceddj54+g40PqHoJdBoZhtvex6dm03WTyp26SiMgULoxUnw8LGL6RZGoHObfL
 LcvZjiBKW3tCTKSt8sgAhHhXP0QRfvDPgGIZLG0PbOjsXpEJKDHUiPrLg/5oAM/Dk48X
 ozhSgkx8NLI/gmBSrrRrrLdw7zM15XBbAr5/ptJxHygZsdQtfEOFi8RvFWoiq7NQuTJ7
 OBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687859457; x=1690451457;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U7LZyYJQE3CVuFw/zJE963Jse2AszMk+Um/1z9JWh0Y=;
 b=XMJFQjisb0bFbZwY3VAkiW9pW4QGGZY8J/C765MNDvq/ddzIzx4Y2Z2RR7Ukt4B/6X
 E/9kBnXApARu/8W7Ve4O5ub+f3v8dmosRkLfc9af61OT7Yk+sK/jHIVbClwn1Rr9U+41
 6WBulQf8gbndM+YlpXCpKmJ2JS4NMt0QhqAFJCxT4mP9TCX6U5R7ncL5AffiXYFWYm3p
 Fbt4PFffUYpTc6B1VvChA/TeDAMTo4IeaCpMQpnFjnufn8292/MsVb4LBW02+s88enOi
 9nhH6PwjjmWPNYdEEqJB+XLrhe0kA8Hs0IyMeD6ac0hwxACm3s/pI+RdclGhKonSpRo/
 NwCw==
X-Gm-Message-State: AC+VfDxeIvZQHFbIOcxUGKYZXeLIOgHKHdewK/k2PhorxsBhH5BZ7TC6
 Ay0kDu6yv6N06b9xG1B5Ya65rujkD1jE48QPZ1srCZviJSo=
X-Received: by 2002:a25:2349:0:b0:c11:731:2a1c with SMTP id
 j70-20020a252349000000b00c1107312a1cmr9380927ybj.53.1687859456669; Tue, 27
 Jun 2023 02:50:56 -0700 (PDT)
MIME-Version: 1.0
From: abhijit patil <patilabhijit180@gmail.com>
Date: Tue, 27 Jun 2023 15:20:46 +0530
Message-ID: <CAJ-ErDDkWPE6QFF5Qvq2OQ55aaMoRPKXT9a-+1Ma79XVkw_c6A@mail.gmail.com>
Subject: Regarding hello world program for ARM M7 (s32k312) using qemu
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000587b7805ff196719"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=patilabhijit180@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Jun 2023 09:31:54 -0400
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
X-TUID: AGLOUKRH0VAF

--000000000000587b7805ff196719
Content-Type: text/plain; charset="UTF-8"

Need hello world program for ARM M7 (s32k312) using qemu...need all files
for startup linker and main .c file and also how to execute the
same....have program using versatilepb....but needed for this specific
board  ARM M7 (s32k312) using qemu

--000000000000587b7805ff196719
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Need hello world program for ARM M7 (s32k312) using qemu.=
..need all files for startup linker and main .c file and also how to execut=
e the same....have program using versatilepb....but needed for this specifi=
c board=C2=A0=C2=A0ARM M7 (s32k312) using qemu</div>

--000000000000587b7805ff196719--
