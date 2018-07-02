Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3614430wrq;
        Mon, 2 Jul 2018 05:53:12 -0700 (PDT)
X-Received: by 2002:aca:dd02:: with SMTP id u2-v6mr14492170oig.355.1530535992781;
        Mon, 02 Jul 2018 05:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530535992; cv=none;
        d=google.com; s=arc-20160816;
        b=tIgbNO6wHTZ3gnsQMmRjr+f7izxiZyZV1aZ6mE9l1glOEJFjMKrr2xXsQSVQ4QeUSL
         HADGmUpTPixwIER/qEevSDDUIbH/lwDTSvtOXRTPC7RXz6BQJyrO8+5GIqIGH9aXvIY+
         d6OVb9neXdMqL58eDAn1l3BUmRdgrg2J2xw7JotTXAX17ml13PSBENKdceqawNqk0sAI
         ogQHVStF6VdiCJo9hc/F4LzdBkfhcL+WWQ6TIf9ABctC5+cu4aiYQND2VLtNClj0z6ca
         TUfIPlUWuzXIbLe+5DJfulFzQlM2U+KZUy7Is4odrYzn69GpFycQCc4+K6j7EuQs+Svj
         iyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZnRYW3jneDGt6RwYNJqBWHlJQFik44Io/uKNKyTOKsM=;
        b=Xp15j/s07S0XlRHG4X1CYHHmSIE+xYpZPQKpD5DWK8FIF8VwX9H7PIG9CfTGso6+i+
         i19AQseikvwPO2Tw+3xCHk7ek38Fh5Q6qIEihsBRksy6ag8B6rUjpLpgUi6wP0jxM/3c
         Sg+GJ9UcJqaO5OEIumhkAOkBLf82HRtbwPQBTbGxeQTNHODQXEUrIhJaoVgI51Hv5Nt5
         cXMLJ7gZ/yuASuGBJ5zc2/saGpS3wQZwlFAsLQnBnyrCQ+zD9R7fuubwMEmgKikhKCFA
         KF0ctzRATn81FdgrslQCN0HmZIBV8kqy/kkX8lEnluujpCKi++gjcw68auxpEVjGEuh9
         aMvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h678RlJG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f202-v6sor265000oic.115.2018.07.02.05.53.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Jul 2018 05:53:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h678RlJG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZnRYW3jneDGt6RwYNJqBWHlJQFik44Io/uKNKyTOKsM=;
        b=h678RlJGrgZEonXBQM+me0ba6n+JQxlRFc6u8EtM3HwEGbIUIX59ua2cYAKCNtzSNn
         jCNSteBIKgaZbv1xHb9vfTIw2TiWcVHfTd0a48n2vRD6nWGUOBlI9URFoNaSz/nbsY/y
         3LM0qXqtKVhWuPAtxezMgwHFz7g8aQ6yhrqJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZnRYW3jneDGt6RwYNJqBWHlJQFik44Io/uKNKyTOKsM=;
        b=XjUSGXqUPoL3VOQEH7dlt9LaRpRcBYpZKmDPN3o2+KqDUuvGt5+NJamCA9ALhd5Yvq
         w47Wdm5eByAywj5DfOYb1fQ8Rv5anwh/G2vq+3QKJ0ZsDBzTQM6Wx0jYGEGpFiQNc2SV
         iO1jaj6hBku/I7Zbob6PD3b7aQevYmA6r8+FFkg33pnpORMH5EYkzVuY5sgh2z2YVX92
         t8RtzmC7Oza0vHu0QZv0d+BeYFtBsqeK9XGsvoKbJngQ57z7cfKCNVObYARZCbkTaoY8
         Y2G/Dn8IbKbSP42ErbneRwH5uCFVJ62k/4xaloZ4I2FXB+24exvsDfO9Owlu8LXVqrPU
         HkPw==
X-Gm-Message-State: APt69E0wk8+Hq6Yz+MEa9b4W7W7wtx/x7ifaOC0Z22aSQfP+/hfxmYDA
	V00dg6vJpkeD8GmHSR2Xn70S/M3Nz3Mo9OGDJoue/GkVg+A=
X-Google-Smtp-Source: AAOMgpf0dOBv/3VS27Dl7TcMvQQYMgHtrVP3y/15XeJPx5VLpZDIxEaw1Yh1fC1ggpigRp0Fl0Nw3l7qv/w24qLpjm8=
X-Received: by 2002:aca:f409:: with SMTP id s9-v6mr16631680oih.102.1530535992350;
 Mon, 02 Jul 2018 05:53:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP; Mon, 2 Jul 2018 05:52:51 -0700 (PDT)
In-Reply-To: <20180622141205.16306-1-alex.bennee@linaro.org>
References: <20180622141205.16306-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Jul 2018 13:52:51 +0100
Message-ID: <CAFEAcA9YE0N4ELyN4Er05RLREGCV4BUyWimJSUQEXLODiXCPYg@mail.gmail.com>
Subject: Re: [RISU PATCH v4 00/22] ARM SVE support for RISU
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: c6KFNJTQlcSD

On 22 June 2018 at 15:11, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Hi Peter,
>
> Not much different from v3 apart from the last SVE register dump patch
> is now fatter with stuff that was from the handle variable VQ series.
> The binary format has stayed the same and we have a current test set
> for SVE at:
>
>   http://people.linaro.org/~alex.bennee/testcases/arm64.risu/sve-all-shor=
t-v83+sve.tar.xz
>
> Unless you have any comments I reckon these are ready to be merged.

Applied to risu master, thanks.

-- PMM
